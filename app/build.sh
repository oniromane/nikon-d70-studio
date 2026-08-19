#!/usr/bin/env bash
# build.sh — assemble D70 Studio.app from source.
#
#   ./app/build.sh              build into app/build/
#   ./app/build.sh --install    build, then copy to /Applications
#
# Produces a self-contained bundle: the Swift shell, the Python server and the
# HTML UI all live inside Contents/Resources, so the .app runs from anywhere.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(dirname "$HERE")"
BUILD="$HERE/build"
APP="$BUILD/D70 Studio.app"
C="$APP/Contents"

command -v xcrun >/dev/null || { echo "Xcode command line tools required."; exit 1; }
command -v magick >/dev/null || { echo "ImageMagick required (brew install imagemagick)."; exit 1; }

echo "==> Clean"
rm -rf "$BUILD"; mkdir -p "$C/MacOS" "$C/Resources/server"

echo "==> Icon"
ICONSET="$BUILD/AppIcon.iconset"; mkdir -p "$ICONSET"
gen() { magick -background none "$HERE/icon.svg" -resize "${1}x${1}" "$ICONSET/icon_$2.png"; }
gen 16   16x16
gen 32   16x16@2x
gen 32   32x32
gen 64   32x32@2x
gen 128  128x128
gen 256  128x128@2x
gen 256  256x256
gen 512  256x256@2x
gen 512  512x512
gen 1024 512x512@2x
iconutil -c icns "$ICONSET" -o "$C/Resources/AppIcon.icns"
rm -rf "$ICONSET"

echo "==> Server payload"
cp "$ROOT/bin/d70-studio"       "$C/Resources/server/d70-studio"
cp "$ROOT/bin/d70-studio.html"  "$C/Resources/server/d70-studio.html"
# the scripts the job launcher shells out to
for s in "$ROOT"/bin/d70-* "$ROOT"/bin/_d70lib.sh; do
  case "$s" in *d70-studio|*d70-studio.html) continue;; esac
  cp "$s" "$C/Resources/server/"
done
chmod +x "$C/Resources/server/"*

echo "==> Info.plist"
cat > "$C/Info.plist" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
  <key>CFBundleName</key><string>D70 Studio</string>
  <key>CFBundleDisplayName</key><string>D70 Studio</string>
  <key>CFBundleExecutable</key><string>D70Studio</string>
  <key>CFBundleIdentifier</key><string>studio.d70.app</string>
  <key>CFBundleIconFile</key><string>AppIcon</string>
  <key>CFBundlePackageType</key><string>APPL</string>
  <key>CFBundleShortVersionString</key><string>1.0</string>
  <key>CFBundleVersion</key><string>1</string>
  <key>LSMinimumSystemVersion</key><string>13.0</string>
  <key>NSHighResolutionCapable</key><true/>
  <key>NSHumanReadableCopyright</key><string>Control surface for the Nikon D70.</string>
  <key>NSAppTransportSecurity</key><dict>
    <key>NSAllowsLocalNetworking</key><true/>
  </dict>
</dict></plist>
PLIST

echo "==> Compile"
xcrun swiftc -O -whole-module-optimization \
  -target arm64-apple-macos13.0 \
  -framework Cocoa -framework WebKit \
  -o "$C/MacOS/D70Studio" "$HERE/D70Studio.swift"

echo "==> Sign (ad-hoc)"
codesign --force --deep --sign - --timestamp=none "$APP"
codesign --verify --deep --strict "$APP" && echo "    signature ok"

if [[ "${1:-}" == "--install" ]]; then
  echo "==> Install"
  rm -rf "/Applications/D70 Studio.app"
  cp -R "$APP" /Applications/
  echo "    /Applications/D70 Studio.app"
fi

echo
echo "Built: $APP"
du -sh "$APP" | awk '{print "Size:  " $1}'
