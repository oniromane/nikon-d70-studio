#!/usr/bin/env bash
# build.sh — assemble D70 Studio.app from source.
#
#   ./app/build.sh              build into app/build/
#   ./app/build.sh --install    build, then copy to /Applications
#   ./app/build.sh --notarize   build, submit to Apple, staple  (needs a cert)
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
cp "$ROOT/bin/d70_data.py"      "$C/Resources/server/d70_data.py"
cp "$ROOT/bin/d70-studio.html"  "$C/Resources/server/d70-studio.html"
# the Guide tab renders this at request time — one source of truth
cp "$ROOT/README.md"            "$C/Resources/server/README.md"
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

echo "==> Sign"
# Prefer a real Developer ID if the keychain has one; fall back to ad-hoc.
# Hardened Runtime goes on either way — notarization requires it, and it costs
# nothing to run with it locally, so the ad-hoc build exercises the same path.
# `|| true` matters: with `set -euo pipefail`, a grep that matches nothing
# exits 1 and takes the whole script down mid-assignment.
IDENTITY="$(security find-identity -v -p codesigning 2>/dev/null \
            | grep "Developer ID Application" | head -1 \
            | sed -n 's/.*"\(.*\)"/\1/p' || true)"

if [[ -n "$IDENTITY" ]]; then
  echo "    identity: $IDENTITY"
  codesign --force --deep --options runtime --timestamp \
           --entitlements "$HERE/D70Studio.entitlements" \
           --sign "$IDENTITY" "$APP"
  SIGNED_REAL=1
else
  echo "    no Developer ID in the keychain — signing ad-hoc"
  echo "    (ad-hoc runs locally but can never be notarised)"
  codesign --force --deep --options runtime --timestamp=none \
           --entitlements "$HERE/D70Studio.entitlements" \
           --sign - "$APP"
  SIGNED_REAL=0
fi
codesign --verify --deep --strict "$APP" && echo "    signature ok"
codesign -d --verbose=2 "$APP" 2>&1 | grep -oE "flags=[^ ]+" | sed 's/^/    /' || true

if [[ "${1:-}" == "--notarize" ]]; then
  echo "==> Notarize"
  if [[ "$SIGNED_REAL" != "1" ]]; then
    cat <<'HELP'
    Cannot notarize: no "Developer ID Application" certificate in the keychain.

    Apple only issues one to paid Apple Developer Program members
    ($99/year). There is no free path — a personal team can sign for local
    development, but not for distribution.

    Once enrolled:
      1. Xcode > Settings > Accounts > Manage Certificates > + >
         Developer ID Application
      2. Create an app-specific password at appleid.apple.com
         (Sign-In and Security > App-Specific Passwords)
      3. Store it once — this command asks for the password itself, so
         nothing is written into this repo:

         xcrun notarytool store-credentials d70-notary \
             --apple-id YOUR_APPLE_ID \
             --team-id  YOUR_TEAM_ID

      4. Re-run:  ./app/build.sh --notarize
HELP
    exit 1
  fi
  ZIP="$BUILD/D70Studio.zip"
  echo "    packaging"
  ditto -c -k --keepParent "$APP" "$ZIP"
  echo "    submitting (this waits for Apple; usually a few minutes)"
  xcrun notarytool submit "$ZIP" --keychain-profile "d70-notary" --wait
  echo "    stapling"
  xcrun stapler staple "$APP"
  xcrun stapler validate "$APP"
  echo "    gatekeeper assessment:"
  spctl -a -vvv -t install "$APP" 2>&1 | sed 's/^/      /'
  rm -f "$ZIP"
fi

if [[ "${1:-}" == "--install" ]]; then
  echo "==> Install"
  rm -rf "/Applications/D70 Studio.app"
  cp -R "$APP" /Applications/
  echo "    /Applications/D70 Studio.app"
fi

echo
echo "Built: $APP"
du -sh "$APP" | awk '{print "Size:  " $1}'
