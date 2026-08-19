// D70Studio — a native macOS shell around the d70-studio control surface.
//
// The UI is the same HTML the CLI serves, but there is no browser involved:
// this is an NSWindow with a WKWebView, its own Dock icon and its own menu.
// The app owns the Python server as a child process and takes it down on quit.

import Cocoa
import WebKit
import Darwin

// MARK: - port helpers

/// True when something is already listening on 127.0.0.1:port.
func portInUse(_ port: UInt16) -> Bool {
    let fd = socket(AF_INET, SOCK_STREAM, 0)
    if fd < 0 { return true }
    defer { close(fd) }
    var addr = sockaddr_in()
    addr.sin_family = sa_family_t(AF_INET)
    addr.sin_port = port.bigEndian
    addr.sin_addr.s_addr = inet_addr("127.0.0.1")
    let rc = withUnsafePointer(to: &addr) {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
            Darwin.connect(fd, $0, socklen_t(MemoryLayout<sockaddr_in>.size))
        }
    }
    return rc == 0
}

func firstFreePort(from start: UInt16, tries: Int = 40) -> UInt16 {
    var p = start
    for _ in 0..<tries {
        if !portInUse(p) { return p }
        p = p &+ 1
    }
    return start
}

// MARK: - app

final class AppDelegate: NSObject, NSApplicationDelegate, WKNavigationDelegate, WKUIDelegate {

    var window: NSWindow!
    var webView: WKWebView!
    var server: Process?
    var port: UInt16 = 8070
    var statusLabel: NSTextField!

    // A GUI app launched from Finder inherits a minimal PATH that does not
    // include Homebrew. Everything this tool shells out to lives there.
    private var toolPath: String {
        let extras = ["/opt/homebrew/bin", "/opt/homebrew/sbin",
                      "/usr/local/bin", "/usr/bin", "/bin",
                      "/usr/sbin", "/sbin",
                      "/Applications/Hugin/tools_mac"]
        let existing = ProcessInfo.processInfo.environment["PATH"] ?? ""
        return (extras + [existing]).joined(separator: ":")
    }

    func applicationDidFinishLaunching(_ note: Notification) {
        buildMenu()
        buildWindow()
        startServer()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ s: NSApplication) -> Bool { true }

    func applicationWillTerminate(_ note: Notification) { stopServer() }

    // MARK: window

    private func buildWindow() {
        let frame = NSRect(x: 0, y: 0, width: 1280, height: 860)
        window = NSWindow(contentRect: frame,
                          styleMask: [.titled, .closable, .miniaturizable, .resizable],
                          backing: .buffered, defer: false)
        window.title = "D70 Studio"
        window.setFrameAutosaveName("D70StudioWindow")
        window.minSize = NSSize(width: 720, height: 520)
        window.backgroundColor = NSColor(srgbRed: 0.078, green: 0.086, blue: 0.075, alpha: 1)
        window.titlebarAppearsTransparent = false
        window.appearance = NSAppearance(named: .darkAqua)

        let cfg = WKWebViewConfiguration()
        cfg.websiteDataStore = .nonPersistent()
        webView = WKWebView(frame: frame, configuration: cfg)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.autoresizingMask = [.width, .height]
        webView.setValue(false, forKey: "drawsBackground")
        webView.allowsBackForwardNavigationGestures = false

        statusLabel = NSTextField(labelWithString: "Starting the camera server…")
        statusLabel.font = NSFont.monospacedSystemFont(ofSize: 12, weight: .regular)
        statusLabel.textColor = NSColor(srgbRed: 0.65, green: 0.68, blue: 0.62, alpha: 1)
        statusLabel.alignment = .center
        statusLabel.frame = NSRect(x: 0, y: frame.height/2 - 12, width: frame.width, height: 24)
        statusLabel.autoresizingMask = [.width, .minYMargin, .maxYMargin]

        let container = NSView(frame: frame)
        container.autoresizingMask = [.width, .height]
        container.addSubview(webView)
        container.addSubview(statusLabel)
        window.contentView = container

        window.center()
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    private func buildMenu() {
        let main = NSMenu()

        let appItem = NSMenuItem()
        main.addItem(appItem)
        let appMenu = NSMenu()
        appMenu.addItem(withTitle: "About D70 Studio",
                        action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent: "")
        appMenu.addItem(.separator())
        appMenu.addItem(withTitle: "Hide D70 Studio", action: #selector(NSApplication.hide(_:)), keyEquivalent: "h")
        appMenu.addItem(withTitle: "Quit D70 Studio", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        appItem.submenu = appMenu

        let viewItem = NSMenuItem()
        main.addItem(viewItem)
        let viewMenu = NSMenu(title: "View")
        viewMenu.addItem(withTitle: "Reload", action: #selector(reload), keyEquivalent: "r")
        viewMenu.addItem(withTitle: "Restart Camera Server", action: #selector(restartServer), keyEquivalent: "R")
        viewMenu.addItem(.separator())
        viewMenu.addItem(withTitle: "Release ptpcamerad", action: #selector(releasePTP), keyEquivalent: "k")
        viewMenu.addItem(.separator())
        let full = viewMenu.addItem(withTitle: "Enter Full Screen",
                                    action: #selector(NSWindow.toggleFullScreen(_:)), keyEquivalent: "f")
        full.keyEquivalentModifierMask = [.command, .control]
        viewItem.submenu = viewMenu

        let winItem = NSMenuItem()
        main.addItem(winItem)
        let winMenu = NSMenu(title: "Window")
        winMenu.addItem(withTitle: "Minimize", action: #selector(NSWindow.miniaturize(_:)), keyEquivalent: "m")
        winMenu.addItem(withTitle: "Zoom", action: #selector(NSWindow.zoom(_:)), keyEquivalent: "")
        winItem.submenu = winMenu
        NSApp.windowsMenu = winMenu

        NSApp.mainMenu = main
    }

    @objc private func reload() { webView.reload() }

    @objc private func releasePTP() {
        let p = Process()
        p.executableURL = URL(fileURLWithPath: "/usr/bin/killall")
        p.arguments = ["-9", "ptpcamerad"]
        try? p.run()
        note("ptpcamerad released")
    }

    @objc private func restartServer() {
        stopServer()
        startServer()
    }

    private func note(_ s: String) {
        webView.evaluateJavaScript(
            "window.toast && toast(\(jsString(s)),'app',true)", completionHandler: nil)
    }

    private func jsString(_ s: String) -> String {
        let escaped = s.replacingOccurrences(of: "\\", with: "\\\\")
                       .replacingOccurrences(of: "'", with: "\\'")
        return "'\(escaped)'"
    }

    // MARK: server

    private func resourceURL(_ name: String) -> URL? {
        if let u = Bundle.main.url(forResource: name, withExtension: nil,
                                   subdirectory: "server") { return u }
        return Bundle.main.url(forResource: name, withExtension: nil)
    }

    private func startServer() {
        guard let script = resourceURL("d70-studio") else {
            fail("Bundled server missing from the app.\nRebuild with app/build.sh.")
            return
        }
        guard let python = ["/opt/homebrew/bin/python3", "/usr/bin/python3", "/usr/local/bin/python3"]
                .first(where: { FileManager.default.isExecutableFile(atPath: $0) }) else {
            fail("No python3 found.\nInstall the Command Line Tools, or Homebrew python.")
            return
        }

        port = firstFreePort(from: 8070)

        let p = Process()
        p.executableURL = URL(fileURLWithPath: python)
        p.arguments = [script.path, "--port", String(port)]
        var env = ProcessInfo.processInfo.environment
        env["PATH"] = toolPath
        env["PYTHONUNBUFFERED"] = "1"
        p.environment = env
        p.standardOutput = FileHandle.nullDevice
        p.standardError  = FileHandle.nullDevice
        do { try p.run() } catch {
            fail("Could not start the camera server.\n\(error.localizedDescription)")
            return
        }
        server = p
        statusLabel.stringValue = "Starting the camera server on port \(port)…"
        waitForServer(attempt: 0)
    }

    private func waitForServer(attempt: Int) {
        if portInUse(port) {
            statusLabel.isHidden = true
            webView.load(URLRequest(url: URL(string: "http://127.0.0.1:\(port)/")!))
            return
        }
        if attempt > 60 {
            fail("The camera server did not come up on port \(port).")
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
            self?.waitForServer(attempt: attempt + 1)
        }
    }

    private func stopServer() {
        guard let p = server, p.isRunning else { return }
        p.terminate()
        let deadline = Date().addingTimeInterval(3)
        while p.isRunning && Date() < deadline { usleep(50_000) }
        if p.isRunning { kill(p.processIdentifier, SIGKILL) }
        server = nil
    }

    private func fail(_ message: String) {
        statusLabel.isHidden = false
        statusLabel.stringValue = message
        statusLabel.maximumNumberOfLines = 0
    }

    // MARK: web view

    func webView(_ w: WKWebView, didFail nav: WKNavigation!, withError error: Error) {
        fail("Could not load the interface.\n\(error.localizedDescription)")
    }

    func webView(_ w: WKWebView, decidePolicyFor action: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        // Keep the app on its own server; anything external opens in the browser.
        if let url = action.request.url, url.host != "127.0.0.1", url.scheme != "about" {
            NSWorkspace.shared.open(url)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.setActivationPolicy(.regular)
app.run()
