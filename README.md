# Nikon D70 — Operating Guide

A 2004 6.1 MP CCD DSLR, driven from a 2026 Apple Silicon Mac.
Built from the *Nikon Guide to Digital Photography with the D70* (218 pp), plus a
survey of what replaced Nikon's own software.

> Page numbers are the manual's **printed** page numbers. In the PDF, add 10:
> printed p.171 = PDF page 181.

**Contents**
[0 Reality check](#0-reality-check) ·
[1 First light](#1-first-light) ·
[2 Control map](#2-control-map) ·
[3 Recipes](#3-recipes) ·
[4 Wiring the Mac](#4-wiring-the-mac) ·
[5 Replacing Nikon Capture 4](#5-replacing-nikon-capture-4) ·
[6 The scripts](#6-the-scripts) ·
[7 One hundred projects](#7-one-hundred-projects) ·
[8 Kit list](#8-kit-list) ·
[9 Faults and care](#9-faults-and-care) ·
[10 Page index](#10-page-index)

---

## 0. Reality check

| | |
|---|---|
| Sensor | 23.7 × 15.6 mm CCD, 6.1 MP effective, **1.5× crop** |
| Image sizes | L 3008×2000 · M 2240×1488 · S 1504×1000 |
| Raw | 12-bit compressed NEF, ~5.0 MB |
| ISO | **200–1600** in ⅓ steps. Base 200. No ISO 100. |
| Shutter | 30 s – **1/8000 s**, bulb |
| Flash sync | **1/500 s** — hybrid mechanical + CCD electronic shutter |
| Built-in flash | GN 15 m / 49 ft at ISO 200 |
| Metering | Matrix (1005-px RGB) · centre-weighted 8 mm · spot 2.3 mm (≈1%) |
| AF | Multi-CAM900, **5 points**, −1 to +19 EV |
| Burst | ~3 fps · buffer 4 NEF / 12 JPEG-Normal-L |
| Storage | CompactFlash Type I/II + Microdrive, FAT16/FAT32 |
| Monitor | 1.8″, 130,000 dots |
| Power | EN-EL3 Li-ion, 3× CR2 in the MS-D70 holder, or EH-5 AC adapter |
| Body | 595 g, 140 × 111 × 78 mm, ¼″ tripod socket |

### What it cannot do

- **No live view.** The CCD cannot feed the LCD. No video, no webcam mode, no remote focus preview, no `gphoto2 --capture-preview`. libgphoto2 lists the D70 with *Image Capture* and *Configuration* only — no preview capability. The **V OUT** socket does not change this: it mirrors the monitor, and the monitor is blank while you shoot (§4.5).
- **No wired remote socket.** The body has three sockets — **DC IN**, **V OUT** and **USB** — and none of them is a shutter release. The D70 has only the ML-L3 infrared receiver; the later D70s added the MC-DC1 jack. Bulb *via ML-L3* caps at **30 minutes** — but see the correction below: bulb is also exposed over USB.

> **Correction.** I originally wrote that computer-driven bulb was impossible on this body. It isn't. The camera exposes `/main/actions/bulb` over PTP as a writable `TOGGLE`, confirmed on the actual hardware. The 30-minute cap is a limit of the *infrared* remote, not of the camera.
- **No built-in intervalometer.** §6 supplies one.
- **No way to push a custom tone curve into the camera.** This was a Nikon Capture 4 feature and nothing replaced it — see §5.

### What it is still unusually good at

- **1/500 s flash sync.** Most DSLRs stop at 1/200–1/250. You can shoot f/2.8 at midday with flash as the key light and drop the sky two stops. Project 11.
- **Commander mode** (CSM 19) drives SB-800 / SB-600 units wirelessly with no radio triggers.
- **A famously weak hot mirror.** The D70 passes far more infrared than its contemporaries — reported R72 exposures around ¼ s where other bodies of the era needed 4 s or longer. Roughly four stops. Project 21.
- **The CCD rendering** — the colour response people now deliberately hunt for.
- **A full F-mount.** Almost any Nikon glass ever made, plus bellows, enlarger optics, telescopes and microscopes — mode **M**, meter inactive.
- **It is cheap.** Bolt it somewhere you would never bolt a modern body.

---

## 1. First light

### Power, card, lens

1. **Battery** (p.14) — camera **off**. Slide the chamber latch open, insert the EN-EL3, latch it. A flat cell takes about two hours on the MH-18.
2. **Card** (p.20) — camera **off**. Terminals first, rear label toward the monitor. The slot sits at a slight angle; match it. The eject button pops up when the card is home.
3. **Lens** (p.18) — camera **off**. Align the mounting marks, rotate counter-clockwise until it clicks. If the lens has an aperture ring, **lock it at the highest f/-number** or you get a blinking `FEE` and no shutter.

### First-run setup

The language dialog appears automatically (p.16). Language → date and time → press `ENTER` to exit. **Skip the `ENTER` and `CLOCK` keeps flashing and the camera will not take a picture.**

The clock battery charges off the main cell and holds about **one month**. A D70 left in a drawer comes back reading 2004.01.01. Reset it (p.161) *before* shooting anything you want filed by date — every script in §6 sorts on `CreateDate`.

### Format the card

Camera on. Hold the **two buttons marked red `FORMAT`** for ~2 s — the shooting-mode button (rear top-left) and the LCD illuminator button (top right). `For` blinks; press both again to confirm. (p.21)

Always format in-camera. It rebuilds the DCIM structure the D70 expects.

### Diopter

Point at something bright. Slide the diopter control right of the eyepiece until the **focus brackets** — not the scene — are sharp. Range −1.6 to +0.5 m⁻¹. (p.27)

### First frame

Mode dial → `AUTO`. Focus-mode selector on the body front → **AF**. Half-press: beep, a focus point lights, `●` appears bottom-left. Press the rest of the way. (pp.24–30)

---

## 2. Control map

| Control | Location |
|---|---|
| Mode dial | Top left |
| Main command dial | Rear right, under your thumb |
| Sub-command dial | Front, under your index finger |
| Multi selector | Rear right — menu nav **and** focus-point selection |
| Focus selector lock | Ring under the multi selector: `●` free, `L` locked |
| Focus-mode selector | Front left of the mount: `AF` / `M` |
| Depth-of-field preview | Front, below the lens release |
| `AE-L/AF-L` | Rear, top right of the thumb rest |

### Button + dial combos (monitor off)

| Want | Hold | Turn |
|---|---|---|
| Image quality — RAW/FINE/NORM/BASIC | `QUAL` | main |
| Image size — L/M/S | `QUAL` | **sub** |
| ISO 200–1600 | `ISO` | main |
| White balance | `WB` | main |
| WB fine-tune ±3 | `WB` | **sub** |
| Metering mode | metering | main |
| Shooting mode | shooting-mode | main |
| Flash sync mode | flash | main |
| Flash compensation | flash + `⚡±` | main |
| Exposure compensation | `±` | main |
| Bracketing | `BKT` | main / sub |
| Shutter speed (S, M) | — | main |
| Aperture (A, M) | — | **sub** |

### Two reset codes

- **Two-button reset** (p.111) — hold `BKT` + metering (the two **green dots**) 2 s. Restores shooting mode, focus area, metering, exposure comp, bracketing, flash mode, image quality, size, WB, ISO, Optimize image. Custom Settings survive.
- **Custom Settings reset** — CSM menu → `R Menu reset` → `Reset` (p.136).

### Unlock the full menu

Setup menu → **CSM menu** → **Detailed**. The factory `Simple` setting hides Custom Settings 10–25. Do this first. (p.161)

| # | Setting | Change to | Why |
|---|---|---|---|
| 8 | Grid display | **On** | Grid lines in the finder. Free horizons. |
| 22 | Monitor off | **10 s** | Biggest battery drain on the camera. |
| 23 | Meter-off | **4 s** | Second biggest. |
| 5 | ISO auto | **Off** | Essential for anything you stack or time-lapse. |
| 12 | BKT set | **AE only** | Unless you want flash bracketed too. |

---

## 3. Recipes

### Exposure modes (p.76)

- **P** — camera picks both. Main dial gives *flexible program*: different pairs, same exposure, shown as `P*`.
- **S** — you set shutter (main), camera sets aperture.
- **A** — you set aperture (**sub**), camera sets shutter.
- **M** — both yours. `bulb` sits past 30 s.

P, S and A need a **CPU lens**. A non-CPU lens forces M with no meter and shows `F--` (p.83).

### Metering (p.75)

Matrix for almost everything. **Spot** meters a 2.3 mm circle that *follows the active AF point*, so you meter a face by putting a focus point on it. Spot in P/S/A also switches flash control from i-TTL Balanced Fill to **Standard i-TTL** (p.94) — exposes for the subject and lets the background fall.

### Focus (pp.64–74)

Two independent axes, which the manual never says plainly:

- **CSM 2 — Autofocus.** `AF-S` locks on confirmation (focus priority; shutter won't fire out of focus). `AF-C` tracks continuously (release priority; shutter fires regardless).
- **CSM 3 — AF-area.** `Single area` you pick and it stays · `Dynamic area` you pick, camera hands off if the subject moves · `Closest subject` camera picks the nearest thing, and cannot be overridden in the scene modes.

Focus lock: half-press holds in AF-S. In AF-C you must press `AE-L/AF-L`; CSM 15 decides whether that locks focus, exposure or both.

Manual focus: the `●` indicator works as an **electronic rangefinder** on any lens f/5.6 or faster. The focal-plane mark on the top plate is where the sensor is — 46.5 mm behind the flange.

### Situations

| | Mode | Settings |
|---|---|---|
| Available-light portrait | A | f/2.8 · spot on the face · AF-S single area · WB Auto |
| Daylight fill-flash | M | **1/500** · f/4 · ISO 200 · flash up, comp −0.7 |
| Landscape | A | f/8–11 · ISO 200 · matrix · Optimize → Landscape · grid · tripod |
| Sports | S | 1/1000+ · AF-C dynamic · continuous · JPEG Normal (buffer 12 vs 4) |
| Macro | M | f/11 · manual focus · **self-timer** (mirror lock-up is cleaning-only here) |
| Night / city | M | 2–30 s · f/8 · tripod · self-timer or ML-L3 · Long exp. NR **on** |
| Star trails | M | 30 s × N · f/2.8 · ISO 400–800 · manual ∞ · Long exp. NR **off** |
| Water / splash | M | 1/250 · f/8 · flash **Manual** 1/16 — flash duration freezes it |
| Copy stand | M | f/8 · ISO 200 · spot a grey card · **PRE** WB off that card · Adobe RGB |

### White balance (p.48)

Auto · Incandescent 3000 K · Fluorescent 4200 K · Direct sunlight 5200 K · Flash 5400 K · Cloudy 6000 K · Shade 8000 K · **PRE**. Each fine-tunes ±3 on the sub dial, ~10 mired per step.

**PRE** (p.52) measures off a card. The abuse: measure off a *coloured* card and the whole palette shifts the complementary way. In-camera cross-processing.

**WB bracketing** (CSM 12) makes up to three balanced copies from **one** release. Unavailable in NEF, and pointless there.

### Optimize Image (p.56)

`Normal · Vivid · Sharp · Soft · Direct Print · Portrait · Landscape · Custom`.

For anything you stack, blend or time-lapse: **Custom**, with Sharpening and Tone comp. at a **fixed** value, never `Auto`. Auto re-decides per frame and you will see it flicker.

**Color mode** (p.59): `Ia` sRGB · `II` Adobe RGB for retouching · `IIIa` punchier sRGB. Adobe RGB files get a leading underscore — `_DSC0001.JPG`.

### Flash (pp.94–104)

Sync modes in P/S/A/M: front-curtain · red-eye · **slow sync** (P/A only, to 30 s) · **rear-curtain** · slow rear-curtain.

CSM 19: `TTL` / `Manual` / **`Commander`**. Flash compensation −3 to +1 EV.

---

## 4. Wiring the Mac

### The camera has two USB personalities

Setup menu → **USB** (p.165):

| Setting | The Mac sees | Use for |
|---|---|---|
| **Mass Storage** (default) | A volume named `NIKON_D70` | Dragging files off the card |
| **PTP** | A controllable camera | **Everything in §6** |

### Install

```bash
./bin/d70-setup
```

Installs `gphoto2`, `libgphoto2`, `exiftool`, `libraw`, `imagemagick`, `ffmpeg`, and the Hugin cask.

```bash
gphoto2 --list-cameras | grep -i "D70"
```

**Verified on this machine (Aug 2026):** gphoto2 2.5.32, and the list contains
`"Nikon DSC D70 (PTP mode)"`. Only PTP mode — there is no Mass Storage entry for this body.

#### About Hugin

`align_image_stack` and `enfuse` exist nowhere else in Homebrew — there is no
`enblend`, no `enblend-enfuse`, no `panotools` formula. The Hugin cask is the only
route, and it carries a warning:

> *hugin has been deprecated because it is not maintained upstream! It was disabled on 2025-11-10.*

It still installs and the tools still work. Three things to know:

1. The CLI lands in **`/Applications/Hugin/tools_mac`**, not on your PATH. `d70-stack` and `d70-studio` both add it themselves; add it to `~/.zshrc` only if you want it in your own shell.
2. The binaries are **unsigned x86_64** and run under Rosetta 2. `codesign` reports *"code object is not signed at all"* and `spctl` rejects them.
3. Because of that, **macOS SIGKILLs the first run of each binary** — exit 137, no stdout, no stderr, no crash report. It looks exactly like a broken install. Clearing it needs a human: macOS shows a Gatekeeper dialog, and you approve the binary there or under **System Settings → Privacy & Security → "Open Anyway"**. It is per-binary, so expect to do it for `align_image_stack` and `enfuse` separately. Nothing you can script around — the approval is the point.

Verified working: `enfuse 4.2.1`, `align_image_stack 2019.2.0`, and a three-frame
focus stack that measurably recovered sharpness in all three regions of a test target.

### The one macOS gotcha

macOS runs a LaunchAgent — `com.apple.ptpcamerad` at `/usr/libexec/ptpcamerad` — that seizes any PTP camera on enumeration. gphoto2 then fails with:

```
An error occurred in the io-library ('Could not claim the USB device'):
Could not claim interface 0 (No such file or directory).
```

**Corrected against real hardware.** An earlier version of this guide said `killall ptpcamerad` and left it there. That is not enough, and two of the obvious next moves are dead ends:

| Attempt | Result |
|---|---|
| `killall ptpcamerad` then work | Fails. launchd restarts it in milliseconds. |
| `killall ptpcamerad; sleep 1` | **Worse.** The sleep hands the window straight back to launchd. This idiom was in every one of my scripts and was the reason none of them could claim the device. |
| `launchctl bootout gui/$(id -u)/com.apple.ptpcamerad` | `Boot-out failed: 150: Operation not permitted while System Integrity Protection is engaged`. SIP is on by default, so the agent cannot be unloaded at all. |
| `killall -9` **immediately** followed by the claim, no sleep | **Works.** Won on the first attempt in testing. |

So the working pattern is to race it and retry:

```bash
for i in $(seq 1 20); do
  killall -9 ptpcamerad 2>/dev/null
  gphoto2 --list-config && break
done
```

That is now `d70_gp` in `bin/_d70lib.sh`, which every script sources. It retries only when gphoto2 dies fast — a lost claim fails in milliseconds, so a slow failure is passed through as a real error rather than being retried pointlessly.

### The third socket — V OUT

Under the same rubber cover as **DC IN** sits **V OUT**, a composite video output (p.170). It is not a remote release and not a data port. It takes the **EG-D100** cable, which was supplied with the camera.

**What it does:** mirrors the monitor to an external display. Nikon's wording is exact — *"the image normally shown in the monitor will be displayed on the television or recorded to video tape. The camera monitor will remain blank, but the camera will function normally in all other respects."*

**What it does not do:** give you live view. It mirrors the LCD, and the D70's LCD shows nothing while you shoot — only playback, menus, and the post-shot review. So V OUT is a *playback and menu* display, not a viewfinder.

Which still makes it genuinely useful, because a cheap composite-to-USB dongle puts that display on the Mac:

- A **big review screen** for copy-stand, macro and telescope work, where the 1.8″ monitor is unreachable, unreadable, or both
- **Menu navigation you can actually see** — and screen-record, if you want a reference of your own settings
- A second monitor for anyone watching over your shoulder, without them crowding the camera

Three things to set:

1. Setup menu → **Video mode** → **NTSC** or **PAL** to match the capture device (p.162). Choose **NTSC** if you have a choice: the manual notes PAL *"selectively reduces"* the pixel count, dropping resolution.
2. Connect and disconnect with the camera **off** (p.170).
3. If you're leaving it connected, use the **EH-5** — with the adapter attached, monitor-off is fixed at ten minutes and the exposure meters stop sleeping. Exactly what a permanently-monitored rig wants.

Set expectations on quality: composite video is roughly 720×480, soft, interlaced and analogue. It's a usable review and menu monitor. It is not a critical-focus tool — for that, `d70-tether` and a real screen.

### First contact

Cable straight into the Mac — **no hub, no keyboard port** (p.172). Camera off when you plug in, then power on.

```bash
./bin/d70-connect
```

The control panel shows `PC`. That's the handshake. Disconnect in PTP by switching off; in Mass Storage eject the volume first. Never pull anything while the green access lamp is lit.

---

## 5. Replacing Nikon Capture 4

Capture 4 bundled four separate jobs. Three have live replacements. One is genuinely gone.

| Capture 4 did | 2026 answer | Cost |
|---|---|---|
| NEF development with Nikon's own rendering | **NX Studio** | free |
| **Image Dust Off** (`.NDF` reference files) | **NX Studio** | free |
| Camera Control — tethering, PC direct-to-disk | **gphoto2** · **darktable** · **Camera Control Pro 2** | free / free / paid |
| Custom tone curve **uploaded into the camera** | *nothing* | — |

### NX Studio is the answer for files

Free, native, and current: Nikon lists **macOS Tahoe 26**, 6-core Intel **or Apple Silicon**, 4 GB RAM. DPReview's review states it "will support all Nikon DSLRs released since the D1 in 1999" — the D70 sits comfortably inside that.

It also inherits the two things Capture 4 never had: **Color Control Points** (U Point) and the **LCH** lightness/chroma/hue tool, both carried over from Capture NX.

Note the one trap in Nikon's own docs: NEFs edited with Nik Color Efex plug-ins, or with optional Picture Controls not installed alongside NX Studio, open as embedded previews only — no editing, no export. Not an issue for D70 files, which predate Picture Controls entirely.

### Image Dust Off is alive — I was wrong about this

I said earlier that the D70's `Dust ref photo` menu item was a dead end. It isn't. NX Studio's supported-formats list explicitly includes **NDF — "Image Dust Off reference data recorded using Nikon digital SLR and mirrorless cameras."** The whole loop works:

1. **Camera** (p.166): CPU lens, focal length ≥ 50 mm, zoom to the long end. Setup menu → **Dust ref photo** → Yes. `rEF` appears.
2. Fill the frame with a **bright, featureless white surface at 10 cm**. Half-press — focus racks to infinity automatically. Shoot. The camera writes `DSC_nnnn.NDF`.
3. Copy the NDF into the **same folder** as the NEFs it should correct.
4. **NX Studio** → Camera Corrections → Image Dust Off.

Constraints worth knowing before you rely on it: **NEF only** — not JPEG, and not Medium or Small NEF. Dust moves, so use a reference from the **last 24 hours**, and always re-shoot it after cleaning the sensor. If the camera says `EXPOSURE SETTINGS NOT APPROPRIATE`, your white surface is too bright or too dark.

### Tethering, ranked

| Tool | D70? | Verdict |
|---|---|---|
| **gphoto2** | **Yes** — libgphoto2's supported list carries "Nikon DSC D70 (PTP mode)" with *Image Capture, Configuration* | What §6 is built on. Free. No preview, because the camera has no live view. |
| **darktable** | **Yes** — its tethering module is a GUI over the same libgphoto2 | Free, native. *Import → mount camera → tethered shoot*, landing straight in a raw editor. Use this if you want a window instead of a terminal. |
| **Camera Control Pro 2** | **Yes** — Nikon lists D70 and D70s among supported bodies | Paid, native Mac, the only officially blessed route and the closest thing to Capture 4's control panel. Nikon lists it in their macOS Sequoia compatibility testing; I could not confirm a macOS 26 statement. |
| **Lightroom Classic 15.5** *(installed)* | **No** tether · yes NEF | The D70 is absent from Adobe's tethered-capture list. Point LR's auto-import at the `d70-tether` folder instead — same result, better library. |
| **Capture One** | Raw **yes** (since 3.7.9) · tether **no** | Listed No / No / No for tethering, Live View and wireless. |
| **NX Tether** | **No** | Nikon's free tethering app is Z-series only. No DSLRs at all. |
| **Sofortbild** | Historically yes for D3-era bodies | Abandoned; broke when Nikon's SDK changed. Don't. |

### CrossOver: what's worth trying, and what isn't

Two facts decide this.

**1 · The 32-bit window is closing.** CrossOver 27, announced June 2026, is Apple Silicon only and **removes 32-bit bottle support entirely**. Nikon Capture 4 is a 2004 32-bit Windows application, so it needs a **Windows XP or 7 32-bit** bottle — a 64-bit bottle will not take it. Anything up to CrossOver 26 can still make one; past that the door shuts.

**2 · It will never tether, at any version.** Wine implements the Windows API, not Windows kernel drivers, and has no generic USB passthrough. Nikon's Windows camera support is a kernel-mode driver. A perfectly-running Capture 4 under CrossOver would simply see no camera. CrossOver is for *file-based* work only — and if you truly need Windows camera software, a full VM with USB passthrough is the only path, not a compatibility layer.

CodeWeavers' compatibility database has no current rating for Capture 4; its Capture NX 2 entry dates to CrossOver Games 9.2 on Ubuntu and is flagged outdated.

**Verdict: don't bother.** NX Studio is native, free, Apple Silicon, supported on macOS 26, and does everything Capture 4 did to files — plus U Point, which Capture 4 never had. The only thing CrossOver could theoretically recover is Capture 4's tone-curve editor, and you still could not push the curve into the camera.

### The custom tone curve is the one real casualty

Capture 4 could author a curve and write it into the D70 over USB, after which `Optimize image → Custom → Tone comp. → Custom` used it for both JPEG and the NEF preview. Nothing does this now: current libgphoto2 has no Nikon curve code in its PTP driver, and NX Studio's Picture Control tooling targets bodies from 2007 onward.

The workaround is the correct workflow anyway — **shoot NEF and apply the curve on the Mac**, where you can change your mind. If you specifically want the D70's look baked into JPEGs, get as close as you can with `Optimize image → Custom` (Tone comp. ±2, Saturation, Hue ±9°) and then build a preset in Lightroom or darktable for the rest.

### The rest of the raw stack

- **Lightroom Classic 15.5** — installed, reads D70 NEF, the practical library.
- **Adobe DNG Converter** — free; NEF → DNG for archival, so you aren't depending on a legacy parser in 2040.
- **darktable / RawTherapee / ART** — free, native, all read D70 NEF; darktable doubles as your tethering GUI.
- **LibRaw** (`dcraw_emu`) — installed by `d70-setup`; the scripting path.
- **argyll-cms** — for project 23, an actual measured profile for this specific sensor.

---

## 6. The scripts

Fourteen programs in `bin/`, plus a native macOS app in `app/`. All write under `~/Pictures/D70` (override with `D70_ROOT`) and all release `ptpcamerad` before touching the camera.

| Script | What it does |
|---|---|
| **`d70-studio`** | **Browser control surface — the whole guide, wired to the camera** |
| `d70-setup` | Installs the whole toolchain via Homebrew |
| `d70-connect` | Frees the USB device, detects the body, prints capabilities |
| `d70-tether` | You press the camera's shutter; frames land on the Mac |
| `d70-interval` | The intervalometer Nikon left out |
| `d70-bulbramp` | Day-to-night "holy grail" ramping across the shutter range |
| `d70-sweep` | Walk any PTP setting across a list of values, one frame each |
| `d70-movie` | Frames → deflickered H.264 |
| `d70-timestrip` | Collapse a sequence into one slit-scan image |
| `d70-stack` | Focus stack · exposure blend · star trails · noise averaging |
| `d70-normalmap` | Four flash directions → a tangent-space normal map |
| `d70-onion` | Live onion-skinning for stop-motion, in a browser |
| `d70-ingest` | Card → dated library, copying, with EXIF-based naming |
| `d70-settings` | Read, snapshot and push camera settings over PTP |



### The app — no browser at all

```bash
./app/build.sh --install
```

That builds **D70 Studio.app** and puts it in `/Applications`. Own Dock icon,
own window, own menu bar, no URL bar and no Safari involved.

It is a native `NSWindow` hosting a `WKWebView` — WebKit renders the interface,
but nothing about it behaves like a browser. The app owns the Python server as a
child process and takes it down on quit, so there is no stray daemon left
listening when you close the window.

| Piece | Where |
|---|---|
| `app/D70Studio.swift` | 265 lines: window, menu, server lifecycle, port picking |
| `app/icon.svg` | The icon, drawn as flat geometry |
| `app/build.sh` | Icon → `.icns`, compile, bundle, ad-hoc sign, install |

The whole thing is self-contained: `Contents/Resources/server/` holds the Python
server, the HTML and all fourteen scripts, so the bundle runs from anywhere and
does not depend on this checkout.

**Menu items worth knowing:** `⌘R` reload · `⇧⌘R` restart the camera server ·
`⌘K` release ptpcamerad · `⌃⌘F` full screen.

Two things the build has to handle that are easy to miss:

* **A GUI app launched from Finder gets a minimal `PATH`** with no
  `/opt/homebrew/bin` in it, so `gphoto2`, `exiftool`, `magick` and `ffmpeg`
  would all be invisible. The Swift shell injects Homebrew and
  `/Applications/Hugin/tools_mac` into the child environment.
* **librsvg in this ImageMagick build renders SVG gradients as solid black.**
  The icon is deliberately flat-filled for that reason — if you edit
  `icon.svg`, keep it to solid fills and check the output rather than trusting it.

#### Signing and notarization

The build always applies the **Hardened Runtime**, which notarization requires
and which costs nothing locally — so the ad-hoc build exercises exactly the same
code path as a signed one. Verified: `flags=0x10002(adhoc,runtime)`, and the app
still spawns its Python child and serves normally under it.

`build.sh` picks a **Developer ID Application** certificate out of the keychain
automatically if one is there, and falls back to ad-hoc if not. Right now this
machine has **zero code-signing identities**, so it signs ad-hoc and
`spctl -a -t exec` returns `rejected` — expected, and harmless for an app you
launch yourself.

**Notarization cannot be completed from here, and not for a technical reason.**
Apple only issues a Developer ID certificate to paid **Apple Developer Program**
members ($99/year). There is no free path: a personal team signs for local
development but never for distribution. It also needs an Apple ID credential,
which belongs in your keychain and not in anyone else's hands.

Everything up to that point is already done. Once you are enrolled:

```bash
# 1. Xcode → Settings → Accounts → Manage Certificates → + → Developer ID Application
# 2. appleid.apple.com → Sign-In and Security → App-Specific Passwords
# 3. Store it once. This command prompts for the password itself —
#    nothing is written into this repo.
xcrun notarytool store-credentials d70-notary \
    --apple-id YOUR_APPLE_ID \
    --team-id  YOUR_TEAM_ID

# 4. One command from there.
./app/build.sh --notarize
```

That target signs with the real identity and a secure timestamp, zips the bundle
with `ditto`, submits it with `notarytool --wait`, staples the ticket, and runs
`spctl` to confirm the verdict flipped to accepted.

Entitlements live in `app/D70Studio.entitlements` and are deliberately thin. The
app is **not sandboxed** — only the App Store requires that, and sandboxing would
cost the free USB access the whole tool depends on. It spawns `python3`, which is
a separately signed system binary needing no exception, and it loads nothing from
disk into its own process, so library validation stays on.

### What the camera actually reports

`reference/` holds what was read off the body (firmware **V1.02**) on 19 Aug 2026:

* `d70-config-keys.txt` — all **210** config paths. 107 are named; 103 are raw PTP property codes under `/main/other/`.
* `d70-observed-state.md` — current values, confirmed enumerations, and the output-format notes needed to parse `gphoto2 --get-config`.

Every candidate key name Studio guesses at resolved correctly, and the tree is much richer than I assumed. Beyond the obvious exposure controls it exposes the whole **Optimize Image** block (`sharpening`, `tonecompensation`, `saturation`, `hueadjustment`), full **bracketing** control, **Commander mode** (`flashcommandermode`, `flashcommanderpower`), the 36-character **Image Comment**, most of the **Custom Settings** menu, and live status including `lightmeter`, `lensname`, `flashcharged`, `acpower` and `maximumshots`.

One parsing detail worth knowing: `gphoto2 --get-config A --get-config B …` returns one block per key separated by a bare `END`, and **never echoes the key path** — blocks pair with requests positionally. Each block carries `Readonly:`, so write permission comes from the camera instead of being guessed.


### Robustness

The whole thing has been through a debug pass. What that found, so nobody has to
find it again:

| Bug | Effect |
|---|---|
| `d70-movie` passed `*.[Jj][Pp][Gg]` to ffmpeg's `-pattern_type glob` | **The script had never worked.** ffmpeg's glob has no character classes, so it got a literal filename. It also reported success regardless. Now it hands ffmpeg an ordered numbered sequence built from the shell's own glob. |
| `d70-stack` on an empty directory | `ALL[@]: unbound variable` from bash before the friendly message could print. `set -u` treats an empty array as unbound in bash 3.2. |
| `d70-interval abc xyz` | `abc: unbound variable` from inside `$(( ))`. Arguments are now checked as whole numbers first. |
| `d70-onion` used `ls \| grep -v onion.jpg` | Would also have dropped a real frame whose name merely contained "onion". Replaced with a glob and an exact basename test. |
| `POST /api/tag {"n":"abc"}` | `int()` raised and **killed the request thread** — the client got no HTTP status at all. |
| `POST /api/card/get {"indices":"nope"}` | Same: iterating a string gave `int("n")`. |
| `POST /api/gear {"all":"not-a-list"}` | **Silently wiped the saved gear list.** Iterating a string yields characters, none match a gear id, so the whole kit reset to defaults. |
| `POST /api/gear {"all":[1,2,{"x":1}]}` | Unhashable dict inside a set comprehension. |
| `/api/guide` re-rendered the README per request | ~100 ms of CPU each time. Sixty concurrent requests hung the server past two minutes. Now cached on mtime — 11× faster, and editing the README still invalidates it. |
| `OWNED` read-modify-write was unguarded | Two concurrent gear ticks could lose one. `gear.json` is now written atomically via a temp file and rename. |
| `JOB_SEQ` increment was unguarded | Two simultaneous job starts could collide on an id. |
| `refresh()` parsed `--list-config` without checking it succeeded | A lost USB claim looked like "camera present but has no settings" rather than an error. |
| `/api/frame` on a file with no EXIF | Returned 404 "not found" for a file that exists. |
| Print CSS forced the overlay visible | Printing any tab produced a blank sheet. |
| `d70-stack noise` wrote `stacked-clean.tif` | Every other mode wrote `stacked-<mode>.tif`. Now consistent. |
| `build.sh --nonsense` | Silently ignored the flag and built anyway. |

Also added a handler-level safety net: a malformed request now returns 500 with
the exception type rather than killing the thread and leaving the client with no
status. `mapfile` was removed — **stock macOS ships bash 3.2**, which does not
have it, so that code path had never run.

**Verified after the pass:** shellcheck clean across all 15 shell files, no dead
locals in either Python file, no bash-4-only syntax anywhere, HTML and JS
balanced, 100 projects / 72 gear / 100 glossary entries with no duplicates or
dangling references, every post-processing script producing correct output, and
every endpoint returning a sane status for hostile input — 60 concurrent mixed
requests in 0.50 s and 20 concurrent gear writes with no lost updates.

**Still unverified, and only hardware can settle it:** everything that actually
talks to the camera. Capture, tether, interval, bulb ramp, sweep, tagging,
snapshots, bracketing and the card browser have been exercised only against a
camera that answers config reads.

### `d70-studio` — the control surface

```bash
./bin/d70-studio          # then open http://127.0.0.1:8070
```

A local web app that puts everything above behind one interface. Python 3
standard library only — no pip, no npm, no build step. Five tabs:

| Tab | What's in it |
|---|---|
| **Camera** | Live LCD-style readout, every writable PTP setting as a dropdown, single-shot capture, recent-frame strip |
| **Recipes** | The ten situations from §3. One click pushes what PTP can set and lists the physical steps — mode dial, metering, CSM items — that you have to do by hand |
| **Projects** | All 40, filterable by family and by whether the example kit covers them. Each pre-fills the right job with the right arguments |
| **Jobs** | Launcher for all 13 scripts with live logs, exit codes and stop buttons |
| **Reference** | Control-panel codes, the traps table, the button combos |
| **Kit** | Your gear inventory. Tick what you own; every project's status recomputes |
| **Glossary** | 100 terms in plain language, for anyone without a photography background |
| **Guide** | This entire document, rendered inside the app — sticky section rail, live filter, scroll-spy |

Three design decisions worth knowing:


#### Pre-flight checks

Every camera job runs a check first. The camera already reports battery level, AC
status, remaining frames, exposure mode, focus mode, white balance and image
review — not looking at them before a four-hour run is choosing to find out the
hard way.

| Condition | Verdict |
|---|---|
| Battery under 30% and a run of 120+ frames | **blocked** — it will die partway |
| Battery under 50% on a long run | warn |
| Card holds fewer frames than the job needs | **blocked** |
| Card margin under 15% | warn |
| Any auto exposure mode for a sequence | warn — it re-decides every frame |
| Autofocus on for a sequence | warn — it hunts and shifts the framing |
| Auto white balance for a sequence | warn — it drifts frame to frame |
| Image review on for a long run | warn — the screen is the biggest drain |
| Long-exposure NR on for a bulb ramp | warn — doubles each cycle, gaps the sequence |
| No CPU lens reported | warn — no metering, no aperture control |
| Mains connected | battery checks skipped entirely |

A block cannot be overridden from the dialog; a warning gives you *Start anyway*.
Short runs and jobs that never touch the camera are waved straight through, so it
does not cry wolf.

#### Frame inspector

No live view means the loop is unavoidably shoot → look → adjust, so that loop
should be tight. Click any frame and you get it at size, a **histogram** with the
RGB channels filled and luma outlined over a quarter-tone grid, shadow and
highlight **clipping percentages**, and the EXIF that produced it.

The histogram is computed server-side with ImageMagick rather than in the
browser, which means it works for **NEF as well as JPEG** — a browser cannot
decode a 2004 Nikon raw file, but ImageMagick can.

#### Project tagging

The camera stamps a 36-character comment into every frame's EXIF, and typing it
on the four-way pad is miserable. **Tag camera** on any project card writes
`P021 Infrared with a 720 nm filter` straight into `imagecomment` over PTP, so
frames label themselves at source and a shoot stays identifiable without a naming
convention anyone has to remember.

#### Rig snapshots

Recipes push fixed values. A snapshot captures **every writable setting exactly
as it stands**, which is more useful, because it remembers whatever you actually
converged on. Save it as *copy stand*, restore it in one click. Stored in
`snapshots/` beside the picture library.

#### Card browser

`gphoto2 --list-files` behind a list you can tick, so you can pull four frames off
the card instead of ingesting all of it.

#### Search across everything

One box over projects, gear, glossary terms and the guide. The guide search walks
the **rendered body text** rather than just section titles and reports the heading
each match sits under, with a snippet — searching titles alone would miss almost
everything. The guide renders in the background at startup so search can reach it
before you ever open that tab.

#### Glossary cross-links

Project notes and the guide body auto-link the first mention of any glossary term
— hover for the definition, click to jump to it. This is what the glossary was
added for: a beginner reading project 12 shouldn't hit "flash duration" and have
to go looking.

Implemented over text nodes with a `TreeWalker`, skipping anything inside a link,
`code`, `pre` or a heading, so it cannot damage the surrounding markup.

#### Printable field sheets

The app is on a desk; the camera often isn't. **Sheet** on any project prints a
one-pager — settings strip, what it is, kit to take, a pre-flight checklist and
two blank note boxes.

#### Bracketing

One button arms a 3-frame AE bracket, since the camera exposes `bracketing`,
`bracketset`, `aebracketingcount` and `evstep` and the menu route is four levels
deep.

#### Live light meter

The camera reports `/main/status/lightmeter`, shown in the readout panel. It is
the only exposure feedback available without a viewfinder. **Unverified:** it read
`0,0` on a body with no lens mounted, so its scale and units still need
confirming against real hardware.

**Nothing is hardcoded as "you can do this".** The Kit tab is the only input.
Every project declares what it needs as gear IDs; the server computes whether you
can run it from what you have ticked. So the Projects tab cannot claim you're
ready for something you have no flash for, and it updates the moment you tick a
box. Your list saves to `gear.json` beside the picture library, not inside the app
bundle, so reinstalling never loses it.

Requirements support alternatives. A telescope **or** a microscope satisfies the
prime-focus project; an optical slave **or** an SC-17 cord gets a flash
off-camera; a macro lens **or** a close-up dioptre is enough for oil-and-water.
Without that the catalogue would either demand more than a project needs or
pretend a cheaper substitute didn't exist.

The Kit tab also ranks **what to buy next** by how many projects each item
unlocks *on its own* — projects blocked by nothing else. That's a more useful
number than a wishlist, because it tells you which single purchase changes the
most.

**A glossary for people who don't do this.** 100 terms across nine categories,
written so that no definition depends on a term you haven't met yet, and so that
the genuinely counter-intuitive things say so — f-numbers running backwards, the
inverse square law, why f/22 isn't sharper than f/8.

**The guide lives in one place.** The Guide tab renders `README.md` at request
time through a small stdlib markdown renderer, into the app's own CSS. There is
no second copy of the document to drift out of date — edit this file and the app
shows the change on next load. `build.sh` bundles the README into
`Contents/Resources/server/` so the installed app carries it.

**It discovers the config keys rather than assuming them.** The D70's PTP
property names aren't documented anywhere I could verify, so at connect time
Studio reads `gphoto2 --list-config` and matches each logical setting
(`iso`, `aperture`, `shutter`, `wb`…) against a list of candidate names. The
Camera tab shows exactly what it resolved and what it couldn't. That turns the
biggest unknown in this project into a visible readout instead of a silent
failure.

**One camera job at a time, enforced.** gphoto2 cannot share the device. Every
camera operation takes a lock, and starting a second camera-touching job returns
`camera already held by job <id>` rather than producing two processes fighting
over USB. Post-processing jobs (`movie`, `stack`, `timestrip`, `normalmap`,
`onion`, `ingest`) are unrestricted because they never touch the camera.

**No fake live view.** There is no preview pane pretending to be a viewfinder,
because this body physically cannot provide one. The Camera tab shows the *last
captured frame* instead, which is the honest affordance.

`killall ptpcamerad` runs before every camera operation, and there's a button
for it when macOS grabs the device mid-session.

### The ones with sharp edges

**`d70-tether`** waits on the camera's `ObjectAdded` event, so frames also stay on the card as a backup. Point Lightroom's auto-import at the session folder.

```bash
./bin/d70-tether ceramics-vase
```

**`d70-interval`** prints a camera checklist first, because a sequence shot in **A** with Auto WB and Auto sharpening flickers and post won't fully save it.

```bash
./bin/d70-interval 10 360 sunset     # every 10 s, 360 frames
./bin/d70-interval 300 288 balcony   # every 5 min for 24 h
```

Past ~200 frames, use the **EH-5** adapter.

**`d70-bulbramp`** reads the shutter-speed choices the body actually reports, then walks the index from one end to the other across the run — exposure tracks the falling light instead of stepping off a cliff at dusk.

```bash
gphoto2 --get-config shutterspeed    # see the list and pick indices
./bin/d70-bulbramp 240 sunset 12 45
```

**`d70-sweep`** is the workhorse for testing. It sets a value, captures, moves on, restores the original, and builds a labelled contact sheet.

```bash
./bin/d70-sweep iso 200 400 800 1600
./bin/d70-sweep f-number f/2.8 f/4 f/5.6 f/8 f/11 f/16
```

What's writable depends on the mode dial — the camera refuses aperture changes in **S**, shutter changes in **A**, and most things in the scene modes. Put it in **M**.

**`d70-ingest`** copies, never moves, and leaves the card intact. The D70's USB link is slow; for a full card a **CF reader** is dramatically faster than the camera.

### Filing by a tag typed on the camera

Setup menu → **Image comment** → *Input comment* (36 chars) → tick *Attach comment* (p.163). Every frame then carries that string in EXIF:

```bash
exiftool -r '-Directory<${Comment}' ~/Pictures/D70/library
```

---

## 7. One hundred projects

Seventeen families. Each exploits something this camera has, or something the Mac
can add that the camera lacks.

The first forty are written out at length — they are the ones I worked through in
most detail. Families **J** onwards are the same idea at shorter length: the
setting strip, the one thing worth knowing, and what it needs. Every project's
gear list is generated from the same table the app reads, so the two cannot drift.

### A · Desk — tethered, repeatable, controlled

**01 · Permanent tethered copy stand**
`M · f/8 · ISO 200 · PRE WB · Adobe RGB · grid on`
Camera inverted on a copy arm, `d70-tether` running, Lightroom auto-importing. Spot-meter a grey card and set PRE white balance off the same card. Sketchbooks, prints, plants, receipts, board-game components, plant specimens. 3008 px across is plenty at A5. Once it's rigged you never re-rig it — that's the whole value.

**02 · Film and slide scanner**
`M · f/8 · ISO 200 · macro or bellows · diffused LED panel`
Shoot NEF, then invert. The orange mask of colour negative is the hard part: invert *first*, then auto-level each channel.
```bash
dcraw_emu -w -q 3 -T neg.NEF
magick neg.tiff -negate -channel RGB -auto-level -colorspace sRGB positive.jpg
```
Faster per frame than any flatbed, and 6 MP is a genuinely usable 35 mm scan for web and small print.

**03 · Cross-polarised art repro**
`M · f/8 · ISO 200 · polariser on the flash, polariser on the lens`
Linear polarising sheet taped over the flash head, **circular** polariser on the lens, rotate the lens filter until specular glare vanishes. The linear/circular distinction is not optional here — the manual is explicit (p.191) that the D70 cannot be used with linear polarisers on the lens; they break the metering and AF beam splitter. On the *flash*, linear is fine and cheaper. Oil paint, varnished panels, glossy prints, coins, anything under glass. This is the single technique that separates a photograph of a painting from a reproduction of one — and the D70's Commander mode means the flash can sit off to the side where it belongs.

**04 · Product turntable**
`M · f/11 · ISO 200 · manual focus · fixed WB`
```bash
./bin/d70-interval 8 36 turntable-mug
```
Eight seconds per frame is enough to turn a platter 10° by hand. Output feeds three things: an animated spin, a photogrammetry solve (project 26), and a plain hero shot. Consistent exposure matters more than resolution, which is exactly what a locked-down 6 MP body is good at.

**05 · Macro focus stacking**
`M · f/8 · manual focus · self-timer · 15–30 frames`
The D70 can't drive focus from the computer, so rack by hand or on a rail. Use f/8, not f/16 — diffraction costs more than the depth gains.
```bash
./bin/d70-stack focus ~/Pictures/D70/library/2026/2026-08-18
```
Insects, circuit boards, mineral specimens, watch movements, seed heads.

---

### B · Time — everything the missing intervalometer unlocks

**06 · The slow observatory**
`M · manual focus · fixed WB · EH-5 mains · CSM 7 image review OFF`
```bash
./bin/d70-interval 900 96 window        # every 15 min for a day
```
Bolt it to a window and leave it a week. A plant reaching, ice melting, a building going up, weather crossing. Wrap it in a `launchd` job to start at civil dawn. This is where a cheap expendable body beats an expensive one outright.

**07 · Time-lapse, properly deflickered**
```bash
./bin/d70-movie ~/Pictures/D70/interval/sunset 24
```
ffmpeg at your frame rate with a `deflicker` pass and a Lanczos downscale. The camera-side discipline in §3 matters more than anything you do here.

**08 · Holy-grail day-to-night ramp**
```bash
gphoto2 --get-config shutterspeed
./bin/d70-bulbramp 240 sunset 12 45
```
The classic hard case: the light falls fifteen stops between golden hour and full dark, and any auto mode flickers its way through. Fixed aperture, and the script walks the shutter down the camera's own list of accepted values one notch at a time. Finish in a raw editor with a linear ramp across the sequence.

**09 · Slit-scan time strips**
```bash
./bin/d70-timestrip ~/Pictures/D70/interval/sunset 4
./bin/d70-timestrip ~/Pictures/D70/interval/tide 8 rows
```
Take the same narrow column out of every frame and lay them side by side. A day of sky becomes one gradient; a tide becomes a waveform; a street becomes a barcode of the light that fell on it. Cheap to make, and one of the few images that genuinely could not exist without the computer.

**10 · Time-stacking and crowd removal**
```bash
./bin/d70-stack noise ~/Pictures/D70/interval/plaza
```
The mean of N frames. Two very different uses from one operation: average eight ISO 1600 frames and the noise falls by √8, landing near a clean ISO 200 exposure; average two hundred frames of a busy plaza and every person who kept walking disappears, leaving the architecture alone under a perfectly smooth sky.

---

### C · Light — what 1/500 sync and Commander mode buy you

**11 · Ambush the sun at 1/500**
`M · 1/500 · f/5.6 · ISO 200 · flash TTL`
The signature trick this body still does better than most. Midday, subject in the open, flash up. The shutter kills the ambient by two-plus stops so the sky renders deep blue and the flash carries the subject alone. Nothing built after about 2006 does this without high-speed sync and the power loss that costs. f/8 for a near-black sky, f/4 for a gentler version.

**12 · Frozen water, by flash duration**
`M · 1/200 · f/11 · CSM 19 → Manual → 1/16 power · room dark`
Shutter speed does not freeze a splash — **flash duration** does. At 1/16 or 1/32 power the pulse is well under 1/10,000 s. Manual focus pre-set on the impact point, dropper above a dish, shutter opens a window and the flash is the actual exposure.

**13 · Off-camera lighting with no radio triggers**
`CSM 19 → Commander · SB-800 / SB-600 · line of sight`
> **Not with an SB-25.** CLS wireless needs an SB-600 or SB-800. With a pre-CLS flash, use a $10 optical slave instead — it fires on seeing the pop-up, with no communication and no TTL, which is fine because you were going to set it manually anyway.

The pop-up becomes a wireless commander. Two groups, ratio control, all from the camera menu. For a body that costs less than a set of radio triggers, this is the best value in the whole system. Works indoors reliably; outdoors in sun you need the remote sensor facing the camera.

**14 · Light painting and long-exposure drawing**
`M · 20–30 s · f/8 · ISO 200 · manual focus · Long exp. NR off if stacking`
Dark room or dark field, torch or EL wire, walk the light through the frame. For runs longer than 30 s, stack shorter frames with `d70-stack trails` instead of using bulb — you keep the option to drop a bad pass.

**15 · Photometric stereo → normal maps for Blender**
`M · f/8 · ISO 200 · one flash, four positions · camera never moves`
Four frames with the flash at ~45° from left, right, top and bottom, plus a fifth flat-lit frame for albedo. Use `d70-tether` so you never touch the body between shots.
```bash
./bin/d70-normalmap left.jpg right.jpg top.jpg bottom.jpg wall-normal.png
```
Out comes a tangent-space normal map: paper grain, fabric weave, bark, stone, tooling marks, leather, PCB silkscreen. Wire it into a Principled BSDF and you have a scanned material. This turns the camera into a texture scanner for the Blender already on this machine.

---

### D · Optics — exploit the F-mount

**16 · Reversed-lens macro**
`M · manual everything · reversing ring (52 mm for the kit lens)`
A 50 mm mounted backwards gives roughly 1:1 for the price of a metal ring. Aperture control disappears with a G lens, so use an older AI-S with an aperture ring, or tape the coupling lever. Depth of field measured in millimetres — feed it straight into project 05.

**17 · Bellows and enlarger optics**
`M · manual focus by rail · f/5.6 · flash or long exposure`
A PB-6 bellows and a 50 mm enlarger lens on an adapter reaches 2:1 and beyond. Enlarger optics are corrected for flat fields at close range, which is exactly the macro case, and they cost almost nothing second-hand. Vibration is the enemy: self-timer, mirror settled, heavy base.

**18 · Vintage manual glass**
`M only · meter inactive · electronic rangefinder still works`
The F-mount takes AI and AI-S Nikkors directly, and M42, Contax and Leica R glass via adapters. The meter doesn't couple (`F--` in the panel) so you expose by histogram — shoot, check, adjust. The `●` rangefinder confirms focus on anything f/5.6 or faster. Fifty-year-old 50 mm lenses render very differently from modern ones and cost less than a memory card.

**19 · Telescope and microscope prime focus**
`M · no lens at all · T-ring to the F-mount`
The camera becomes the eyepiece. On a telescope, the scope *is* the lens — focus with the scope's focuser, expose by trial. On a microscope trinocular port, the same. **V OUT** into a capture dongle (§4.5) gives you the camera's playback screen at desk size, which is the difference between guessing and seeing. `d70-tether` matters enormously here: you cannot look through the finder on most rigs, and every touch of the body ruins the frame.

**20 · Pinhole body cap**
`M · f/≈180 · ISO 200 · 2–30 s · Long exp. NR on`
Drill a body cap, tape a shim of foil pierced with a needle over the hole. Infinite depth of field, dreamlike softness, and exposures long enough that people walking through vanish. The cheapest possible lens for a camera that already owes you nothing.

---

### E · Beyond the visible, and measurement

**21 · Infrared with a 720 nm filter**
`M · Hoya R72 · manual focus · PRE WB off foliage through the filter · tripod`
The D70's weak hot mirror is its most famous quirk — reported R72 exposures around ¼ s where contemporaries needed 4 s or more, roughly four stops of advantage. No conversion required. Set PRE white balance off sunlit grass *through the filter* or everything comes out solid red. Focus shifts in IR: focus visually, then stop down to f/8–11 to cover it. Then swap the red and blue channels for the classic false-colour look:
```bash
magick ir.jpg -separate -swap 0,2 -combine ir-swapped.jpg
```

**22 · Deep-sky stacking**
`M · 30 s · f/2.8 · ISO 800 · manual ∞ · Long exp. NR off`
```bash
./bin/d70-interval 34 200 orion
```
Two hundred light frames plus darks, flats and bias, stacked in Siril. A CCD from 2004 is not a cooled astro camera, but ISO 800 for 30 s × 200 is a legitimate hundred-minute integration, and the D70's IR sensitivity actually helps on H-alpha regions.

**23 · Build a measured profile for this sensor**
`M · f/8 · ISO 200 · ColorChecker · even D65-ish light`
```bash
brew install argyll-cms
# develop the chart shot to a linear TIFF first
scanin -v -p chart.tif ColorChecker.cht ColorChecker.cie diag.tif
colprof -v -D "Nikon D70 CCD" -qm chart
```
Reference `.cht` and `.cie` paths vary by install — check `man scanin`. The result is an ICC profile describing what *this* CCD actually does, rather than what Adobe assumes. If you like the D70 colour, this is how you find out what it objectively is.

**24 · A lens testing bench**
```bash
./bin/d70-sweep f-number f/1.8 f/2.8 f/4 f/5.6 f/8 f/11 f/16
```
Tripod, resolution chart, `d70-sweep` walks the aperture and hands you a labelled contact sheet. Corner softness, chromatic aberration, vignetting, focus shift, the actual sharpest stop. Do it once per lens and stop guessing. Add the depth-of-field preview button for a visual check of what the aperture is really doing.

**25 · Densitometry**
`M · fixed everything · step wedge or ND filters on a light panel`
```bash
magick step.tif -crop 100x100+400+300 +repage -format "%[fx:mean]" info:
```
Photograph a Stouffer step wedge, or your own ND filters, against an even backlight and read mean pixel values. You get a real transfer curve: how much light an ND filter actually blocks, what a film's density range really is, whether a lens's marked f-stop matches its T-stop. Turns the camera into an instrument with a number at the end.

---

### F · Feeding other software

**26 · Photogrammetry → Blender**
`M · f/11 · ISO 200 · even diffuse light · fixed everything`
Turntable passes from project 04, two or three elevations, 36 frames each. Solve in Meshroom or RealityCapture, clean in Blender. Consistent exposure and a fixed focal length matter far more than megapixels; a locked-down D70 outperforms a phone that re-decides everything per frame.

**27 · Bracketed panorama → HDRI world lighting**
`M · f/8 · ISO 200 · 3-frame AE bracket · nodal rail · fixed WB`
Shoot a full spherical bracket on a panoramic head, stitch to equirectangular in Hugin, fuse the brackets, and load the result as Blender's World environment texture. Now your renders are lit by an actual room you were standing in. The D70's ±2 EV three-frame bracket covers most interiors; add a second bracket at −4 EV for a window or a bare bulb.

**28 · Gigapixel panorama**
`M · fixed exposure · nodal rail · 30–50% overlap · telephoto`
6 MP per tile times a hundred tiles is a 600 MP image. Hugin does the stitching. Cityscapes, cathedral interiors, book pages at absurd resolution. The counter-intuitive part is that a low-resolution body is *fine* here — you're buying resolution with tiles, not with the sensor.

**29 · Event detection from a long sequence**
```bash
./bin/d70-movie ~/Pictures/D70/interval/yard 24
ffmpeg -i yard-24fps.mp4 -vf "select='gt(scene,0.08)',showinfo" -vsync 0 events/%04d.png
```
Shoot every ten seconds for a day, then let ffmpeg find the frames where something actually changed. A wildlife watch, a package delivery, a leak, a visitor. The camera has no motion trigger; the computer supplies one after the fact, which for a fixed frame works just as well and never misses because it was asleep.

**30 · Distil the CCD's look into a LUT**
`M · f/8 · ISO 200 · ColorChecker · identical light for both cameras`
Photograph the same chart with the D70 and with a modern camera or phone under identical lighting. Read the 24 patch values out of both with ImageMagick, then fit the mapping from modern → D70 as a matrix plus tone curve, and bake it into a 3D LUT. You end up with the D70's actual colour response as a file you can apply to anything — the honest version of the "CCD look" everyone chases with presets. Project 23's profile is the rigorous half of the same idea; this is the usable half.

### G · Triggers — beating the missing remote socket

**31 · Build the trigger the camera never had**
`CSM 25 Remote → 15 min · shooting mode → quick-response remote`
The D70 has no remote terminal, but it does have an infrared receiver on the front of the grip, and the ML-L3's protocol is a documented 38 kHz carrier with a fixed pulse sequence. An ESP32 or Arduino plus a $2 IR LED can emit it. Once you can emit the shutter code, **any** sensor becomes a shutter release: PIR motion, a microphone, a laser tripwire, a reed switch on a door, a photodiode watching for lightning.
Two details that will otherwise waste your evening: set **CSM 25 (Remote) to 15 minutes** — the default is one minute, after which the camera stops listening and silently reverts to single-frame. And the receiver is on the *front* of the body with about a 5 m line-of-sight range, so your emitter has to be in front of the lens, not behind the camera.

**32 · Sound-triggered high speed, with no trigger at all**
`M · bulb via ML-L3 · f/11 · ISO 200 · room fully dark · flash on a sound trigger`
The elegant version sidesteps the camera entirely. Open the shutter on bulb, let the room stay dark, and put the *flash* on the sound trigger. Balloon pop, glass shattering, a hammer through a biscuit, a droplet's second bounce — the flash fires at the moment of impact and the flash duration is the exposure. Shutter latency stops mattering, which is precisely why this method suits a body with no trigger port. Sound-trigger modules run $25–60, or build one from a microphone and a comparator.

**33 · Stroboscopic chronophotography**
`M · 2–4 s · f/8 · ISO 200 · SB-25 or SB-800 in RPT · dark room`
The SB-800 has a **repeating flash (RPT)** mode where you set a frequency in hertz and a number of pulses; the SB-600 does not — and neither does it matter, because the **SB-25 has RPT too**, and the manual confirms it works on the D70 (p.188). Open the shutter for two seconds while the subject moves through the frame and you get N frozen positions in a single image — a golf swing, a pendulum, a bouncing ball, a spinning coin, water leaving a tap. The camera does nothing clever here; it just holds the shutter open. All the work is the flash, which is why a 2004 body is no handicap at all.

### H · Physics on a tabletop

**34 · Spectroscopy with a diffraction grating**
`M · f/5.6 · manual focus at ∞ · ISO 200 · NEF`
A sheet of 1000 lines/mm diffraction grating film costs about $10. Tape a piece over the front of the lens, aim through a narrow slit at a light source, and you photograph its spectrum. What shows up immediately: sodium street lamps give two hard lines, fluorescent tubes give mercury lines over a phosphor hump, white LEDs give a blue spike plus a broad yellow band, incandescent gives a smooth continuum, and the sun — carefully, indirectly, off a white card — gives Fraunhofer absorption lines. Shoot NEF and you can read *relative intensity*, not just position:
```bash
magick spectrum.tif -crop 2000x1+500+1000 +repage -depth 8 txt: | head -40
```
Cheapest genuinely scientific thing you can do with this camera.

**35 · UV-induced fluorescence**
`M · 5–30 s · f/5.6 · ISO 400 · 365 nm torch off-axis · dark room · tripod`
A 365 nm UV torch and a dark room. Fluorescent minerals, scorpions, banknote security threads, laundry brighteners in white fabric, tonic water, highlighter ink, and — the serious application — old varnish and retouching in paintings, which is how art authentication actually starts.
**Get 365 nm, not 395 nm.** The cheaper 395 nm torches leak visible violet and wash the effect out completely. Put a UV-blocking filter on the lens so you record only the visible fluorescence, keep the torch out of frame and off-axis, and don't look into it.

**36 · Photoelasticity — stress made visible**
`M · f/8 · ISO 200 · tripod · crossed polarisers`
You are already buying two polarisers for project 03. Put the linear sheet on a light panel behind the subject and the circular one on the lens, cross them until the field goes black, then put clear stressed plastic in between: a plastic fork, a protractor, a CD case, a 3D-printed part under load, a glass with a manufacturing flaw. Internal stress appears as rainbow fringe patterns. This is a real engineering technique — photoelastic stress analysis — and it happens to be beautiful.

**37 · The sun, safely**
`M · start 1/500 f/8 ISO 200 · manual focus on the limb · self-timer or ML-L3`
> **Read this part properly.** You need a **full-aperture solar filter over the front of the lens** — Baader AstroSolar film, about $35 for a sheet you can mount yourself, or a Thousand Oaks glass filter. Never a filter at the eyepiece end. Never welding glass of unknown grade. **Never an ND filter alone** — ND blocks visible light but passes infrared, which will cook the sensor and, through the finder, your retina. And never leave the camera pointed at the sun with the filter off, even for a moment: the mirror and shutter curtain will burn.

With the filter fitted: sunspots at 300 mm and up, partial eclipses, planetary transits. The 1.5× crop helps — a 300 mm behaves like 450 mm. With no live view you cannot magnify to focus, so bracket focus across several frames and pick the sharpest afterwards.

### I · Repetition

**38 · Rephotography**
`M · record everything · return`
Pick a viewpoint and return to it — every month, or every year. Record the position precisely: coordinates, focal length, tripod height, and a reference frame you can line up against. The D70 is ideal here specifically because it is cheap enough to dedicate permanently to one project, and its files are small enough to still be openable in thirty years.
Use **Image comment** (p.163) to stamp the project name into every frame so the camera itself remembers what it is doing, and align the series afterwards:
```bash
align_image_stack -a reg_ -C 2015.tif 2020.tif 2026.tif
```
Pair it with the V OUT screen (§4.5) to compare against last year's frame while you set up this year's.

**39 · Stop-motion with real onion-skinning**
`M · manual focus · fixed WB · d70-tether`
The thing a DSLR without live view can't do is show you the previous frame while you pose the next one. So build it:
```bash
./bin/d70-tether claymation          # terminal 1
./bin/d70-onion ~/Pictures/D70/tether/claymation 2   # terminal 2
```
`d70-onion` watches the folder, blends the last N frames every time you shoot, and writes a self-refreshing `onion.html`. Open it once in a browser on a second screen and you have onion-skinning for free. Assemble with `d70-movie` at 12 or 15 fps.

**40 · An event photo booth**
`M · 1/60 · f/8 · ISO 200 · one flash · PRE WB · focus locked on a taped mark`
`d70-tether` running, the Mac screen showing the last frame full-size, and the ML-L3 in the guests' hands — the camera has no wired remote, but for this one job the infrared remote is exactly the right interface. Lock focus manually on a taped floor mark so nobody's dark jumper defeats the AF, and auto-build the classic four-up strip as you go:
```bash
cd ~/Pictures/D70/tether/party
magick $(ls -t *.JPG | head -4 | tail -r) -resize 800x -append \
       -bordercolor white -border 20 strip-$(date +%H%M%S).jpg
```


### J · Lens hacks

**41 · Freelensing**  
`M` · `lens detached and tilted` · `f wide open`  
Hold the lens a millimetre off the mount and tilt it. You get a wedge of focus across the frame and light leaks around the edges — a poor man's tilt lens. Do it lens-down and briefly: the mount is open to dust.  
*Needs:* Vintage manual lens

**42 · Custom bokeh shapes**  
`M` · `f/1.8–2.8` · `card over the front`  
Cut a shape into black card, tape it over the lens, and every out-of-focus highlight takes that shape. Works only near maximum aperture — stop down and the aperture blades win.  
*Needs:* Fast prime (f/1.8 or wider)

**43 · Petroleum-jelly soft filter**  
`M` · `clear filter` · `smear the edges`  
A thin film of vaseline on a *sacrificial* clear filter — never the lens. Leave the centre clean and the subject stays sharp inside a dissolving frame. Unrepeatable, which is the appeal.  
*Needs:* UV-blocking filter

**44 · A magnifying glass for a lens**  
`M` · `manual focus by moving`  
Tape a cheap loupe over a drilled body cap. Enormous aberration, a sweet spot the size of a coin, and a look no modern lens will give you.  
*Needs:* Spare body cap, Magnifying glass / loupe, Tripod

**45 · Coupled reversed lens**  
`M` · `f/2.8 front lens` · `tele behind`  
Mount a 50 mm backwards onto the front of a telephoto with a male-to-male ring. Magnification is roughly the tele's focal length divided by the reversed lens's — a 200 mm and a 50 mm gives 4:1.  
*Needs:* Reversing ring, Fast prime (f/1.8 or wider), Telephoto zoom (200 mm+)

**46 · Extension tubes**  
`M` · `manual focus` · `f/8`  
Hollow spacers, no glass, no optical penalty. They cost light rather than quality — every millimetre of extension darkens the finder, which is why you focus by moving the whole camera.  
*Needs:* Extension tubes

**47 · Anamorphic squeeze**  
`M` · `projector lens taped on`  
A salvaged anamorphic front element in front of a telephoto squeezes the frame horizontally. Unsqueeze in post and you get oval bokeh and horizontal flares no filter fakes convincingly.  
*Needs:* Projector or anamorphic lens, Telephoto zoom (200 mm+)

**48 · Prism and crystal-ball refraction**  
`M` · `f/2.8–4` · `prism at the edge`  
Hold a prism at the corner of the lens and rotate it until a reflection lands where you want it. A crystal ball inverts the scene inside itself — focus on the ball, not through it.  
*Needs:* Prism or crystal ball, Fast prime (f/1.8 or wider)

**49 · Shift for architecture**  
`M` · `f/8` · `bellows shifted, not tilted`  
Keep the sensor parallel to the building and shift the lens up instead of tilting the camera. Verticals stay vertical without the keystone correction that throws away pixels.  
*Needs:* Bellows (PB-6 or similar), Tripod, Wide-angle lens

**50 · Zone plate and sieve apertures**  
`M` · `f/≈128` · `2–20 s`  
Instead of one pinhole, many — or a set of concentric rings. A sieve gives a soft glow around highlights; a zone plate focuses by diffraction rather than refraction. Both are printable on transparency.  
*Needs:* Spare body cap, Tripod


### K · Shaping light cheaply

**51 · A softbox from a cardboard box**  
`M` · `f/8` · `flash inside the box`  
Line a box with white paper, tape baking parchment over the opening, fire the flash into it. Size is what makes light soft, not price — a metre of parchment beats a small expensive modifier.  
*Needs:* Any external flash, Optical slave shoe *or* SC-17 TTL cord, Softbox, brolly or diffusion

**52 · Ring light from LED strip**  
`M` · `f/8` · `strip round the lens`  
A loop of LED strip on a card collar gives shadowless frontal light and a circular catchlight. Ugly for portraits, ideal for macro, coins and circuit boards.  
*Needs:* LED panel, Clamps, arms, gaffer tape

**53 · Gels and colour contrast**  
`M` · `f/5.6` · `two lights, two gels`  
Warm the key, cool the background, and the eye reads depth that isn't there. Gels also fix mixed lighting: match the flash to the room instead of fighting it in post.  
*Needs:* Any external flash, Optical slave shoe *or* SC-17 TTL cord, Colour gels

**54 · Snoot and grid from drinking straws**  
`M` · `f/8` · `tight beam`  
A bundle of black straws taped over a flash head collimates the beam into a hard circle. The cheapest way to light one thing and nothing else.  
*Needs:* Any external flash, Snoot, grid or barn doors, Optical slave shoe *or* SC-17 TTL cord

**55 · Beauty dish from a mixing bowl**  
`M` · `f/5.6` · `bounced centre`  
A steel bowl with a small disc blocking the direct path bounces light off the sides. Crisper than a softbox, softer than bare flash — the classic portrait quality.  
*Needs:* Any external flash, Reflector or foam board, Clamps, arms, gaffer tape

**56 · White or black from one light**  
`M` · `f/8` · `inverse square`  
Light falls off with the square of distance. Move the subject away from the backdrop and it goes black; light the backdrop separately and it goes white. Same room, same light, opposite results.  
*Needs:* Any external flash, Backdrop (black and white), Optical slave shoe *or* SC-17 TTL cord

**57 · Light-painting a large subject**  
`M` · `20–30 s × N` · `composite`  
You cannot light a barn with one flash, but you can light it in twenty passes and lighten-blend the frames. Each pass is one manageable piece of the problem.  
*Needs:* Tripod, Bright torch / light wand, Hugin CLI (align/enfuse)

**58 · Gobos and shadow play**  
`M` · `f/5.6` · `hard source`  
Cut a shape from card and put it between a hard light and the wall — venetian blinds, foliage, a window that isn't there. Hard light and a sharp edge are the whole technique.  
*Needs:* Any external flash, Snoot, grid or barn doors, Clamps, arms, gaffer tape


### L · Water, smoke, fire

**59 · Water drop collisions**  
`M` · `1/200` · `f/11` · `flash 1/32`  
The second drop hitting the rebound column of the first is the shot. Repeatability is everything: a valve rig and a fixed delay beat reflexes every time.  
*Needs:* Drip rig / valve, Any external flash, Optical slave shoe *or* SC-17 TTL cord, Tripod, Laser line or pointer

**60 · Smoke art on black**  
`M` · `1/200` · `f/8` · `side light`  
One hard light from the side, flagged so none of it reaches the black background. Invert the result and the smoke turns to ink on white.  
*Needs:* Any external flash, Snoot, grid or barn doors, Incense or fog source, Backdrop (black and white)

**61 · Ink in water**  
`M` · `1/250` · `f/8` · `backlit tank`  
Backlight the tank through diffusion, drop ink in with a syringe, shoot continuously. Milk gives billowing clouds; ink gives filaments. Warm water speeds it up.  
*Needs:* Tank, glass and syringes, Any external flash, LED panel, Tripod

**62 · Balloon burst**  
`M` · `bulb` · `dark` · `sound trigger`  
The flash is the exposure, fired by the pop. Water-filled balloons hold their shape for a few milliseconds after the skin is gone — that is the frame you want.  
*Needs:* Sound trigger, Any external flash, ML-L3 infrared remote

**63 · Oil and water abstracts**  
`M` · `f/11` · `backlit, raised dish`  
A dish of water with oil on top, held well above a colourful backdrop so it falls out of focus. The oil beads become lenses full of colour.  
*Needs:* Tank, glass and syringes, Macro lens *or* Close-up dioptre lens, LED panel, Tripod

**64 · Fire and steel wool**  
`M` · `15–30 s` · `f/8` · `ISO 200`  
Spinning burning steel wool throws sparks in long arcs. **Do this on bare ground, away from anything dry, with a fire extinguisher and eye protection, and not alone.** A cheap body earns its keep here.  
*Needs:* Tripod, Bright torch / light wand

**65 · Candle and flame macro**  
`M` · `1/125` · `f/5.6` · `ISO 400`  
A flame is its own light source, so meter for the flame and let everything else go black. The interesting structure is in the first millimetre above the wick.  
*Needs:* Macro lens *or* Close-up dioptre lens, Tripod, Backdrop (black and white)


### M · The camera as scanner

**66 · Scanography, upside down**  
`M` · `f/8` · `glass sheet` · `dark room`  
Objects on a sheet of glass with the camera below and a light above. Flowers, feathers, watch parts — everything renders on a perfectly black field because there is nothing behind it.  
*Needs:* Copy stand or tripod arm, LED panel, Tank, glass and syringes

**67 · Book and document scanning**  
`M` · `f/8` · `ISO 200` · `V-cradle`  
A cardboard V-cradle holds the spine open without cracking it. Two lights at 45° kill the page shine. A page every four seconds beats any flatbed.  
*Needs:* Copy stand or tripod arm, LED panel, ML-L3 infrared remote, CF card reader (USB-C)

**68 · Tileable texture library**  
`M` · `f/8` · `flat even light`  
Shoot brick, fabric, bark and concrete square-on with a polariser to kill specular sheen, then offset the image by half and heal the seam. Pairs with the normal-map project.  
*Needs:* Copy stand or tripod arm, LED panel, Circular polariser, Blender

**69 · Coin and stamp catalogue**  
`M` · `f/8` · `stacked` · `ring light`  
Focus-stacked so the whole relief is sharp, raking light from one side so the relief reads at all. Two lighting passes — flat for colour, raking for form.  
*Needs:* Macro lens, LED panel, Macro focusing rail, Hugin CLI (align/enfuse)

**70 · Herbarium plates**  
`M` · `f/11` · `scale bar in frame`  
A specimen, a scale bar and a colour reference in every frame. That is what separates a record from a snapshot — someone can measure and colour-match from it decades later.  
*Needs:* Copy stand or tripod arm, LED panel, 18% grey card

**71 · Reflectance Transformation Imaging**  
`M` · `f/8` · `fixed camera` · `N light positions`  
Thirty to fifty frames, light moved around a dome of positions, camera locked. The software then lets you relight the object interactively — you can read worn inscriptions that are invisible under any single light.  
*Needs:* Copy stand or tripod arm, Any external flash, Optical slave shoe *or* SC-17 TTL cord, Tripod


### N · Long time

**72 · Sun paths across a season**  
`M` · `f/8` · `same frame, months`  
The digital cousin of solargraphy: one frame at solar noon every day, lighten-blended. The sun's arc climbs and falls across the composite and you can see the solstice happen.  
*Needs:* Tripod, EH-5 AC adapter

**73 · The analemma**  
`M` · `same clock time` · `one year`  
Photograph the sun at exactly the same clock time weekly for a year and it traces a figure-of-eight. Requires obsessive framing discipline and pays it back in one impossible-looking image.  
*Needs:* Tripod, EH-5 AC adapter, Wide-angle lens

**74 · A lunation**  
`M` · `1/125` · `f/8` · `300 mm`  
One frame of the moon a night for a month, laid out as a grid. The terminator sweeps across and the craters near it are the only ones with any relief.  
*Needs:* Telephoto zoom (200 mm+), Tripod

**75 · Shoreline and tide**  
`M` · `fixed frame` · `twice daily`  
Two frames a day for a season shows the tide as a waveform and the coast as a slow drift. Time-strip the sequence and the tide becomes literally a wave on the page.  
*Needs:* Tripod, EH-5 AC adapter

**76 · Plant growth**  
`M` · `every 15 min` · `fixed WB` · `LED`  
Constant artificial light beats daylight here — it removes the day/night flicker entirely and lets you run a clean sequence for weeks.  
*Needs:* Tripod, EH-5 AC adapter, LED panel

**77 · Decay and mould**  
`M` · `hourly` · `sealed jar` · `LED`  
Fruit in a sealed jar, lit continuously, one frame an hour for a fortnight. Unsettling, beautiful, and completely hands-off once running.  
*Needs:* Tripod, EH-5 AC adapter, LED panel, Tank, glass and syringes

**78 · A seasonal quartet**  
`M` · `same frame ×4` · `one year`  
One tree, one viewpoint, four frames — solstices and equinoxes. The smallest possible long-term project, and the one most likely to actually get finished.  
*Needs:* Tripod


### O · Motion and dimension

**79 · Stereo pairs and wigglegrams**  
`M` · `shift 65 mm` · `two frames`  
Shoot, slide the camera one eye-width sideways, shoot again. Combine as a red/cyan anaglyph, or just alternate the two frames as a GIF — the wobble reads as depth with no glasses.  
*Needs:* Macro focusing rail, Tripod

**80 · One-camera bullet time**  
`M` · `fixed subject` · `arc of positions`  
A static subject and a camera walked around an arc gives the frozen-orbit shot without twenty bodies. Mark the floor; consistent radius matters more than consistent spacing.  
*Needs:* Tripod, Macro focusing rail

**81 · Panning studies**  
`S` · `1/30–1/60` · `AF-C` · `continuous`  
Track the subject, fire through the movement, keep the background streaking. A deliberately low keeper rate — shoot fifty, expect three.  
*Needs:* Telephoto zoom (200 mm+)

**82 · Zoom burst**  
`S` · `1/8–1/30` · `zoom during exposure`  
Turn the zoom ring while the shutter is open. Everything streaks radially from the centre except whatever sits dead centre. Works best against point lights.  
*Needs:* Telephoto zoom (200 mm+), Tripod

**83 · Kinetic camera**  
`M` · `1/4–2 s` · `strap on`  
Swing, spin or drag the camera during a long exposure against bright lights. The cheapest body you own is the right one for this, and the strap is not optional.  
*Needs:* nothing beyond the basics

**84 · Rotational blur**  
`M` · `1–4 s` · `subject spinning`  
Spin the subject instead of the camera and the background stays sharp while the object smears into a solid of revolution. Flowers and machinery both work.  
*Needs:* Turntable / lazy susan, Tripod, LED panel *or* Neutral density filter

**85 · Cinemagraph**  
`M` · `interval` · `mask one region`  
Take a still frame, then let one region play from the sequence — steam, water, a flag. Everything else frozen. The contrast is what sells it.  
*Needs:* Tripod


### P · Measurement

**86 · Front- and back-focus test**  
`M` · `f wide open` · `45° chart`  
A ruler at 45° with a target at a known point shows whether the AF lands in front of or behind where you aimed. The D70 has no AF fine-tune, so the answer is a lens-choice fact, not a fixable one.  
*Needs:* Focus test chart / ruler, Tripod

**87 · Sensor dust map**  
`A` · `f/22` · `defocused white wall`  
One frame of a blank white surface at f/22, heavily contrast-boosted, shows every speck. Shoot it monthly and you can watch dust arrive — and prove a clean actually worked.  
*Needs:* Rocket blower

**88 · Shutter count and usage history**  
`exiftool over the library`  
The D70 records a shutter count in the maker notes. Run it across your whole library and you get an actuation history — plus which focal lengths and apertures you actually use, as opposed to think you do.  
*Needs:* nothing beyond the basics

**89 · Automated sharpness scoring**  
`M` · `chart` · `aperture sweep` · `measure`  
Sweep the aperture, then score each frame by the standard deviation of its Laplacian in the centre and the corners. You get a curve, not an opinion.  
*Needs:* Resolution chart, Tripod

**90 · Noise and dynamic range per ISO**  
`M` · `fixed scene` · `ISO sweep`  
Shoot a grey card at every ISO, measure the standard deviation of a flat patch, and you have this sensor's read-noise curve. Then you know where 'too high' actually is for this body rather than for the internet's.  
*Needs:* Tripod, 18% grey card

**91 · Measuring flash duration**  
`M` · `dark` · `spinning disc`  
Photograph a marked spinning disc lit only by the flash. The arc length the mark travels, against known RPM, gives you the flash's actual duration at each power setting.  
*Needs:* Any external flash, Turntable / lazy susan, Tripod

**92 · Colour constancy across sources**  
`M` · `ColorChecker` · `every lamp`  
The same chart under daylight, tungsten, fluorescent and LED. Compare the patch values and you can see which sources have holes in their spectrum that no white balance will fix.  
*Needs:* ColorChecker (Classic or Mini), Tripod


### Q · Art and print

**93 · Digital negatives for cyanotype**  
`NEF → invert → transparency`  
Print an inverted image on transparency film, contact-print it onto cyanotype-coated paper under UV. A 6 MP file is plenty — the process resolves far less than the sensor does.  
*Needs:* Inkjet + transparency film, 365 nm UV torch

**94 · Contact sheets as the artefact**  
`montage the take`  
Print the whole roll, not the selects. The rejects, the framing drift and the second attempt are the record of how the picture was actually found.  
*Needs:* CF card reader (USB-C)

**95 · Photo mosaic from your own library**  
`one image from thousands`  
Build a target image out of the tiles of everything else you have shot. Needs a big library, which is what a decade of a cheap camera gives you.  
*Needs:* nothing beyond the basics

**96 · Databending a raw file**  
`NEF → bytes → glitch`  
Open the raw as bytes, corrupt some deliberately, reopen. NEF is fragile in interesting ways — the compression means one flipped byte smears colour across a whole band.  
*Needs:* nothing beyond the basics

**97 · The ghost portrait**  
`M` · `N frames` · `mean blend`  
Average twenty frames of someone sitting still and everything that moved — eyes, breath, hands — becomes a soft blur inside a sharp figure. A long exposure without the highlight clipping.  
*Needs:* Tripod

**98 · Diptychs and grids, automatically**  
`montage from EXIF`  
Pair frames by time, focal length or subject and lay them out programmatically. The constraint does the editing for you, which is often better than taste.  
*Needs:* nothing beyond the basics

**99 · Proofing against a measured profile**  
`profile → soft proof → print`  
With a real profile for the camera and one for the printer, you can see on screen what the paper will actually do before spending the ink.  
*Needs:* ColorChecker (Classic or Mini), ArgyllCMS, Inkjet + transparency film

**100 · A printed index of everything**  
`EXIF → cards`  
Generate an index card per shoot — thumbnail, date, settings, the Image Comment you typed on the camera. A physical index is the one that still works when the software does not.  
*Needs:* nothing beyond the basics

---

## 8. Kit list

Every accessory named in this guide, with what it costs and where it comes from.
Prices are **rough USD estimates as of August 2026** — used-market items in
particular swing wildly.

> The **Kit tab in the app** is the live version of this: all 72 items the 100
> projects ask for, tickable, with each project's readiness computed from what you
> own and a ranked list of what to buy next. This section is the reasoning behind
> the catalogue — the traps, the substitutions, the order to buy in. New / used split is noted where it matters.

### A worked example kit

Rather than leave the tables abstract, the rest of this section is worked through one
common D70-era combination — the kit zoom, a cheap telephoto and a pre-CLS flash.
Substitute your own; the reasoning transfers.

| Item | What it means |
|---|---|
| **AF-S DX 18–55 mm f/3.5–5.6G ED** | **52 mm** filters · 27–82 mm equivalent · **G** type, so there is no aperture ring to lock |
| **AF 70–300 mm f/4–5.6D ED** | **62 mm** filters · 105–**450 mm** equivalent · **D** type, so the ring **must** be locked |
| **Nikon SB-25 Speedlight** | GN 42 (m, ISO 100, 35 mm) — roughly 4× the built-in · **non-TTL only** on this body |

For that pairing every filter recommendation resolves to **52 mm** or **62 mm**, so one 62 mm filter plus a 62→52 step-down ring (~$8) serves both lenses. Check the ⌀ mark on your own glass.

#### The lenses

Both sit on the manual's fully-supported list (p.183). The 70–300 is a **D-type AF Nikkor**, which puts it in the *top* row of the compatibility table alongside G and AF-S glass: autofocus, 3D colour matrix metering, spot metering, every exposure mode. The D70 has a built-in AF motor, so the screw-drive 70–300 autofocuses normally — that would not be true on a D40 or a D3000.

The difference between the two that will actually bite: **the 70–300 has an aperture ring and the 18–55 does not.** Lock the 70–300 at its highest f/-number with the slider, or you get a blinking `FEE` and no shutter (pp.18, 184). The 18–55 is a G lens with nothing to lock.

At 300 mm that is a **450 mm equivalent** (p.185), which is what makes projects 22 and 37 realistic without buying any glass.

Worth five seconds with any zoom: focus from near to far and watch the front ring. If it rotates, set your polariser **after** focusing, every time — projects 03 and 36 depend on the polariser's angle.

#### The SB-25 — read this before you mount it

The manual (p.188) groups the SB-25 with `SB-80DX · SB-28DX · SB-28 · SB-26 · SB-25 · SB-24` and is unambiguous about what that group can do:

| SB-25 mode | On the D70 |
|---|---|
| **A** — non-TTL auto | **works** |
| **M** — manual | **works** |
| **RPT** — repeating flash | **works** |
| **REAR** — rear-curtain sync | **works** |
| **TTL** | **the shutter release locks and the camera will not fire at all** |

That last row is the one that will convince you something is broken. Nikon's exact wording: *"If they are set to TTL, the camera shutter-release button will lock and no photographs can be taken."* Put the SB-25 in **A** or **M** and it behaves perfectly.

Three consequences for the project list:

- **Project 13 (Commander mode) does not work.** CLS wireless needs an SB-600 or SB-800; the SB-25 predates the system by a decade. To get it off-camera you need an **SC-17 TTL cord** ($25–40 used), a **$10 optical slave** that fires when it sees the built-in flash, or radio triggers (~$30). The optical slave is the cheapest route and works indoors.
- **Project 33 (stroboscopic) works today.** I wrote that one around the SB-800, but the SB-25 has repeating flash and the manual confirms RPT is available on the D70. Free unlock.
- **Projects 11 and 12 work today.** The manual states the shutter synchronises with an external flash at **1/500 s or slower** (p.189), and the SB-25 in **M** at 1/16 gives you the short flash duration project 12 needs.

Two smaller ones from p.189: **auto power zoom does not work** with the SB-25, so set its zoom head manually to match your focal length; and AF-assist comes from the camera's own illuminator, not the flash's.

On the 250 V hot-shoe warning on p.186 — that's aimed at third-party and studio units. The SB-25 is a Nikon Speedlight on Nikon's own compatibility list.

#### What that kit runs with nothing more than a card and a tripod

**04** turntable · **05** focus stacking · **06** observatory · **07** time-lapse · **08** bulb ramp · **09** slit-scan · **10** time-stack · **11** 1/500 ambush · **12** splash freeze · **14** light painting · **22** wide-field deep sky · **24** lens bench (you have two lenses to test) · **25** densitometry · **26** photogrammetry · **28** gigapixel (the 70–300 is exactly right) · **29** event detection · **33** stroboscopic · **38** rephotography · **39** stop-motion

Nineteen of the forty, on that combination alone.

#### The cheapest things that unlock the most

| Buy | Cost | Opens |
|---|---|---|
| **Optical slave shoe** for the SB-25 | **$10** | Off-camera light — projects 03, 15, and a poor man's 13 |
| **Spare BF-1A body cap** | **$5** | Project 20, the pinhole. Drill the spare, not your only one. |
| **ML-L3 remote** | **$17** | Bulb, projects 32 and 40, vibration-free release everywhere |
| **Diffraction grating film** | **$10** | Project 34 — spectroscopy |
| **62 mm circular polariser + linear sheet** | **~$55** | Projects 03 and 36 |
| **62 mm Hoya R72** | **~$85** | Project 21 — infrared, the D70's party trick |
| **Baader AstroSolar sheet** | **~$35** | Project 37 — pair it with the 300 mm end |

Under **$220** takes you from nineteen projects to roughly thirty. The expensive remainder — bellows, macro glass, ColorChecker, nodal head, telescope — is genuinely optional.

### Read this before ordering anything

The D70 is old enough that several obvious-looking purchases are wrong.

| Trap | What happens | Buy instead |
|---|---|---|
| **ML-L7** remote | Dead on arrival. It's Bluetooth; the D70 has only an infrared receiver. | **ML-L3** (infrared) |
| **EP-5 dummy battery** for the AC adapter | Unnecessary expense. Later bodies need one; the D70 has a real **DC-in socket**, so the EH-5 plugs straight in. | Bare **EH-5 / EH-5a / EH-5b** |
| **EN-EL3a** "because it's the original" | Works in the D70, but won't physically fit a D80/D200/D300/D700 if you ever add one. | **EN-EL3e** — fits the D70 *and* everything newer |
| A **64 or 128 GB CF card** | May not be recognised. Nikon's own approved-card table (p.192) tops out at **4 GB**. | **2–4 GB**. 4 GB ≈ 800 NEF or 3,000 JPEG-Normal-L frames. |
| A **linear** polariser | The manual is explicit (p.191): *"The D70 can not be used with linear polarizing filters."* It breaks the metering and AF beam splitter. | **Circular** polariser, marked **C-PL** |
| Leaving the **SB-25 in TTL** | The shutter release locks — the camera fires nothing at all, and looks broken (p.188). | **A** or **M** on the flash |
| Expecting the **SB-25 to work in Commander mode** | It predates CLS by a decade. Nothing will trigger it wirelessly from the pop-up. | $10 optical slave, SC-17 cord, or radio triggers |
| Expecting **V OUT** to give live view | It mirrors the monitor, and the monitor is blank while you shoot. It's a playback and menu screen (§4.5). | Nothing — the D70 has no live view at all |
| A filter in the wrong thread | Check the ⌀ mark on the lens front ring. An 18–55 kit zoom is **52 mm**; a 70–300D is **62 mm**. | Buy for the largest, add step-down rings (~$8) |

Also from p.191: any filter with an exposure factor over 1× — including every C-PL and ND — should be metered **centre-weighted**, not matrix.

### Tier 1 — without these, nothing in this guide runs

| Item | Brand | Est. price | Where |
|---|---|---|---|
| **EN-EL3e battery** ×2 + charger | Wasabi, Kastar, LP (third-party kits) | **$18–28** the set | Amazon |
| — genuine Nikon, used | Nikon | $30–50 | KEH · MPB · eBay |
| **MH-18a charger** alone | Nikon, used | $20–35 | KEH · eBay |
| **CompactFlash card, 2–4 GB** | SanDisk Ultra / Lexar (new-old-stock) | **$10–20** new · $5–10 used | Amazon · eBay |
| **CF card reader**, USB-C | Anker, Sabrent, UGREEN | **$15–25** | Amazon |
| **UC-E4 USB cable** | third-party replacement | **$6–12** | Amazon · eBay |
| — genuine Nikon, used | Nikon (part 25262) | $10–15 | KEH · eBay |

The card reader matters more than it looks: the D70's own USB link is slow, and `d70-ingest` over a reader finishes a card in a fraction of the time.

> On the cable — the UC-E4 terminates in a mini-USB connector, but I could not confirm from Nikon's own documentation whether a bare generic mini-B cable is electrically identical. Buy one sold **as a UC-E4** and skip the question.

### Tier 2 — each of these unlocks a whole family of projects

| Item | Brand | Est. price | Unlocks | Where |
|---|---|---|---|---|
| **EH-5 / EH-5a / EH-5b AC adapter** | third-party clone | **$19–40** | Projects 06, 08, 22, 29 — anything over ~200 frames. Also mirror-lock-up cleaning. | Amazon · eBuyBatteries |
| — genuine Nikon, used | Nikon | $40–70 | | KEH · eBay |
| **ML-L3 infrared remote** | Nikon | **$17–20** new | Bulb up to 30 min, self-portraits, vibration-free release | B&H · Adorama |
| — generic IR clone | ProMaster, JJC | $5–10 | | Amazon · eBay |
| **Tripod** that won't ruin a 30 s exposure | Manfrotto Befree, Benro Slim, K&F | **$60–150** | Projects 05–10, 14, 20, 22, 24, 27, 28 | B&H · Amazon |
| **Rocket blower** | Giottos Rocket-Air | **$12–18** | Sensor cleaning (§9). The only thing that should ever touch the low-pass filter. | B&H · Amazon |
| **SB-600 Speedlight**, used | Nikon | **$80–130** | Project 13 — Commander mode | KEH · MPB · eBay |
| **SB-800 Speedlight**, used | Nikon | **$150–250** | as above, plus manual power down to 1/128 for project 12 | KEH · MPB · eBay |
| **Grey card**, 18% | Lastolite Ezybalance, DGK | **$10–20** | PRE white balance, spot metering — projects 01, 03, 23 | B&H · Amazon |
| **Composite-to-USB capture dongle** | generic "EasyCap" style | **$12–25** | Puts the **V OUT** playback screen on the Mac (§4.5) — projects 01, 02, 05, 19 | Amazon · eBay |
| — a good one | Elgato Video Capture | $70–90 | as above, without the driver roulette | B&H · Amazon |
| **EG-D100 video cable**, if yours is missing | Nikon, or third-party | **$5–15** | connects V OUT to RCA | eBay · B&H |

Commander mode needs an **SB-600 or SB-800** specifically; the built-in flash cannot command the cheaper manual-only units.

### Tier 3 — per project

**Filters and optics**

| Item | Brand | Est. price | Project | Where |
|---|---|---|---|---|
| **R72 720 nm infrared filter** | Hoya | **$55–65** (52 mm) · $85–110 (67 mm) | 21 | B&H · Adorama |
| **Circular polariser (C-PL)** | Hoya, K&F Concept | **$25–70** by size | 03 | B&H · K&F direct |
| **Linear polarising sheet** for the flash head | Lee 239, Rosco | **$25–40** per sheet | 03 | B&H · Adorama |
| **ND filter** | K&F, Hoya | **$25–50** | Hi-warning bailout, daylight long exposure | B&H · Amazon |
| **Reversing ring**, 52 mm → F | generic | **$8–15** | 16 | Amazon · eBay |
| — Nikon **BR-2A**, used | Nikon | $40–60 | | KEH · eBay |
| **T-ring**, T2 → Nikon F | generic, Celestron | **$12–25** | 19 | B&H · Amazon |
| **M42 → Nikon F adapter** *with* corrective optic | Fotodiox, K&F | **$15–30** | 18 | Amazon |
| **Enlarger lens**, 50 mm | EL-Nikkor, Schneider Componon, used | **$25–60** | 17 | eBay · KEH |
| **PB-6 bellows**, used | Nikon | **$150–300** | 17 | KEH · eBay |
| **Macro focusing rail** | generic 4-way / Neewer | **$25–60** · $150+ for a good one | 05, 16, 17 | Amazon · B&H |

**Rigs and support**

| Item | Brand | Est. price | Project | Where |
|---|---|---|---|---|
| **Copy stand** | Kaiser RS-1, Smith-Victor | **$60–200** | 01, 02, 03, 15 | B&H · Adorama |
| — cheap alternative | tripod + horizontal arm | $25–45 | | Amazon |
| **Nodal / panoramic head** | Neewer, Sunwayfoto | **$50–120** · $300+ for RRS | 27, 28 | Amazon · B&H |
| **Turntable / lazy susan** | any | **$15–30** | 04, 26 | hardware store |
| **LED light panel** for film | Raleno, Viltrox | **$30–80** | 02 | Amazon |
| — dedicated film light | Kaiser Slimlite Plano | $120–150 | | B&H |
| **Film holder** | Valoi, Negative Supply, Lobster | **$40–300** | 02 | maker direct |

**Targets and measurement**

| Item | Brand | Est. price | Project | Where |
|---|---|---|---|---|
| **ColorChecker Classic** | Calibrite | **$160–170** | 23, 30 | B&H · Calibrite direct |
| — **Classic Mini / Nano**, same 24 patches | Calibrite | **$60–90** | as above, and pocketable | B&H · Calibrite direct |
| **Stouffer step wedge** T2115 | Stouffer Industries | **$30–50** | 25 | stouffer.net |
| **Resolution chart**, ISO 12233 or USAF 1951 | Applied Image, Edmund | **$20–60** | 24 | supplier direct |
| — or print your own | — | free | | download and print |

**Triggers, physics and the sky**

| Item | Brand | Est. price | Project | Where |
|---|---|---|---|---|
| **ESP32 or Arduino** + IR LED + resistor | generic | **$10–18** | 31 — emit the ML-L3 code | Amazon · AliExpress |
| **PIR motion sensor** (HC-SR501) | generic | **$3–6** | 31 | Amazon · AliExpress |
| **Sound trigger module** | generic, or DIY mic + comparator | **$25–60** | 32 | Amazon · eBay |
| **Diffraction grating film**, 1000 lines/mm | Rainbow Symphony, Edmund | **$10–15** per sheet | 34 | supplier direct · Amazon |
| **365 nm UV torch** — *not* 395 nm | Convoy S2+, Alonefire | **$15–25** | 35 | Amazon · AliExpress |
| **UV-blocking filter** for the lens | Hoya UV(0), B+W 010 | **$15–35** | 35 | B&H · Amazon |
| **Baader AstroSolar film**, ND 5.0 | Baader Planetarium | **$30–40** per sheet | 37 | B&H · Agena Astro |
| — ready-made glass solar filter | Thousand Oaks | $80–150 | 37 | B&H · Agena Astro |

**Do not improvise a solar filter.** ND filters, exposed film, smoked glass and unrated welding glass all pass infrared. See project 37.

**Nikon viewfinder accessories** (p.190, all used-market only)

| Item | Est. price | Why |
|---|---|---|
| **DR-6 right-angle viewing attachment** | **$60–120** | Look *down* into the finder. Transforms copy-stand and low-angle work — projects 01, 02, 03, 05, 20. |
| **DG-2 magnifier** + eyepiece adapter | **$40–80** | 2× magnified centre for critical manual focus — projects 05, 16, 17, 19. |
| **Diopter-adjustment lens**, −5 to +3 m⁻¹ | **$20–40** | If the built-in −1.6 to +0.5 range doesn't reach your eyes. |
| **BF-1A body cap** | **$5–10** | Keeps dust out — and it's the donor part for the project 20 pinhole. Buy two. |

### Where to buy, by category

- **New photo gear** — [B&H](https://www.bhphotovideo.com) and [Adorama](https://www.adorama.com) in the US; Wex, Park Cameras or [MPB](https://www.mpb.com) in the UK/EU. Both B&H and Adorama ship internationally.
- **Used Nikon** — [KEH](https://www.keh.com) and [MPB](https://www.mpb.com) both grade condition and give a warranty, which matters for twenty-year-old electronics. eBay is cheaper and riskier.
- **Batteries, cables, adapters, generic rings** — Amazon or AliExpress. There is no meaningful quality difference in a reversing ring.
- **Colour targets** — buy direct from [Calibrite](https://calibrite.com) or [Stouffer](https://www.stouffer.net). Counterfeit ColorCheckers exist and defeat the entire purpose.
- **Filters** — B&H or Adorama for Hoya; [K&F Concept](https://www.kentfaith.com) direct for budget glass that is genuinely fine at f/8.

*I don't know your region — everything above is USD and US-centric. B&H, Adorama, MPB and KEH all ship internationally; substitute your local equivalent where it's cheaper.*

### A sensible order of purchase

1. **Battery kit + CF card + card reader + USB cable** — ~$60. The camera becomes usable and everything in §6 runs.
2. **Tripod + rocket blower** — ~$90. Half the projects open up and the sensor stays clean.
3. **EH-5 adapter + ML-L3** — ~$40. All the time-based work becomes possible.
4. **SB-600 + grey card** — ~$110. Light, Commander mode, accurate colour.
5. Then buy per project. Nothing below this line is needed twice.

---

## 9. Faults and care

### Sensor dust

No ultrasonic cleaner. Dust shows as soft dark blobs at f/11 and smaller. Setup menu → **Mirror lock-up** → Yes, then release the shutter. `- - - - - -` blinks and the mirror stays up until you switch off. Blow the low-pass filter with a **hand blower only** — never compressed air, never a brush, never a finger (pp.162, 194).

Nikon recommends running mirror lock-up on the **EH-5**: if the battery dies mid-clean, the mirror drops. And see §5 — the `Dust ref photo` route into NX Studio genuinely works, so a dusty sensor is recoverable in software as long as you shoot NEF.

### Battery reality

| Scenario | EN-EL3 | 3 × CR2 |
|---|---|---|
| Continuous, JPEG Basic, M size, monitor off | ~2000 | ~560 |
| Single-frame, JPEG Normal, L, flash every shot | ~400 | ~160 |

Kills it: the monitor, repeated AF hunting, NEF, slow shutter speeds, resting on the half-press.

### Symptoms

| Display | Meaning | Fix |
|---|---|---|
| `FEE` blinking | Aperture ring not at minimum | Lock to the highest f/-number (p.18) |
| `F--` | Non-CPU lens | Mode M; meter inactive (p.83) |
| `CLOCK` blinking | Clock reset | Setup → Date (p.161) |
| `Hi` / `Lo` | Beyond meter range | ND filter, or change ISO / aperture |
| `CHA` blinking | Card problem | Reformat; try another card |
| `-E-` | No card | Insert one |
| `Full` / `FuL` | Card or buffer full | Offload, or lower quality |
| `Job nr` | Long-exposure NR running | Wait — as long again as the exposure |
| `----- --` | Mirror locked up | Switch off to drop it |
| `rEF` | Dust-off reference pending | Shoot the white surface (p.166) |
| Shutter dead in a scene mode | Non-CPU lens | Scene modes need a CPU lens (p.32) |
| Shutter dead with a flash fitted | SB-25 (or any pre-CLS Speedlight) set to **TTL** | Switch the flash to **A** or **M** (p.188) |
| gphoto2 can't claim device | `ptpcamerad` holds it | `killall ptpcamerad` |
| Mac ignores the camera | PTP with nothing listening | Mass Storage, or run a §6 script |

**Last resort:** the reset switch under a cover on the camera base (p.200) restores everything, clock included.

### Storage

Remove the battery for long storage — a fully discharged lithium-ion cell can be damaged by sitting that way. Recharge every six months. Body cap on, mount pointing **down** when no lens is attached.

---

## 10. Page index

*(PDF page = printed page + 10)*

| | p. | | p. |
|---|---|---|---|
| Camera body diagrams | 3–5 | Flash photography | 94–104 |
| Control panel legend | 6–7 | Self-timer | 105 |
| Viewfinder legend | 8–9 | ML-L3 remote | 107 |
| Mode dial | 10–11 | **Two-button reset** | **111** |
| First steps | 13–22 | Playback | 113–122 |
| Basic photography | 24–30 | Shooting menu / Long exp. NR | 132–133 |
| Scene modes | 32–34 | **Custom Settings 1–25** | **135–154** |
| Image quality / size | 41–45 | Setup menu | 155–168 |
| ISO | 46–47 | **USB — PTP vs Mass Storage** | **165** |
| White balance | 48–55 | **Dust ref photo** | **166** |
| Optimize Image | 56–61 | Mirror lock-up | 162 |
| Shooting mode / buffer | 62–63 | Image comment | 163 |
| Focus | 64–74 | **Connecting to a computer** | **171–174** |
| Metering | 75 | Cleaning the low-pass filter | 194 |
| Exposure modes | 76–83 | Troubleshooting | 198–200 |
| Exposure comp / bracketing | 86–93 | Specifications | 201–205 |

---

## Sources for §5

- [libgphoto2 supported cameras](https://gphoto.github.io/proj/libgphoto2/support/) — "Nikon DSC D70 (PTP mode) · Image Capture, Configuration"
- [NX Studio](https://www.nikonusa.com/content/nx-studio) — free, macOS 26 Tahoe, Apple Silicon
- [NX Studio supported formats](https://nikonimglib.com/nxstdo/onlinehelp/en/supported_formats_4.html) — NDF Image Dust Off reference data
- [DPReview: NX Studio review](https://www.dpreview.com/reviews/nikon-nx-studio-review) — "all Nikon DSLRs released since the D1 in 1999"
- [Nikon: Camera Control Pro 2](https://www.nikonusa.com/content/nx-tether) and [supported-body listings](https://www.adorama.com/Reviews/pwr/product-reviews/Cameras-Lenses/Digital-Cameras-Accessories/Nikon/p/INKSWCPS-Nikon-Camera-Control-Pro-Software-for-Macintosh-amp-Windows-Compatible-Only-with-the-D2-Series-D1-series-D200-D100-D70s-D70-amp-D50) — D70 / D70s supported
- [Adobe: tethered camera support](https://helpx.adobe.com/lightroom-classic/kb/tethered-camera-support.html) — D70 absent
- [Capture One: supported cameras](https://support.captureone.com/hc/en-us/articles/360002718118-Camera-Models-and-RAW-Files-Supported-by-Capture-One) — D70 raw since 3.7.9, no tethering
- [Nikon NX Tether](https://www.nikonusa.com/content/nx-tether) — Z-series only
- [darktable: tethering](https://docs.darktable.org/usermanual/development/en/tethering/overview/) — GUI over libgphoto2
- [Nikon: discontinuation of ViewNX / Capture NX](https://www.nikonimgsupport.com/eu/BV_article?articleNo=000050770&lang=en_GB) — download links removed June 2022
- [CrossOver 27 drops 32-bit bottles and Intel Macs](https://windowsforum.com/threads/crossover-27-ends-intel-mac-support-and-32-bit-bottles-sonoma-apple-silicon-only.425511/)
- [CodeWeavers: using USB devices with CrossOver](https://support.codeweavers.com/troubleshooting/using-usb-devices-with-crossover)
- [D70 infrared sensitivity discussion](https://www.dpreview.com/forums/thread/1656896) — R72 at ~¼ s vs 4 s+ for contemporaries
