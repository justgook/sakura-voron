#!/bin/bash
set -euo pipefail

app="${1:-/Applications/OrcaSlicer.app}"
info="$app/Contents/Info.plist"

if pgrep -x OrcaSlicer >/dev/null; then
    echo "Quit OrcaSlicer before patching." >&2
    exit 1
fi
if [[ ! -f "$info" ]]; then
    echo "OrcaSlicer Info.plist not found: $info" >&2
    exit 1
fi

/usr/libexec/PlistBuddy -c 'Delete :NSLocalNetworkUsageDescription' "$info" 2>/dev/null || true
/usr/libexec/PlistBuddy -c 'Delete :NSBonjourServices' "$info" 2>/dev/null || true
/usr/libexec/PlistBuddy -c 'Add :NSLocalNetworkUsageDescription string OrcaSlicer connects to 3D printers on your local network.' "$info"
/usr/libexec/PlistBuddy -c 'Add :NSBonjourServices array' "$info"
/usr/libexec/PlistBuddy -c 'Add :NSBonjourServices:0 string _moonraker._tcp' "$info"
/usr/libexec/PlistBuddy -c 'Add :NSBonjourServices:1 string _octoprint._tcp' "$info"
/usr/libexec/PlistBuddy -c 'Add :NSBonjourServices:2 string _http._tcp' "$info"

codesign --force --sign - --preserve-metadata=entitlements,flags,runtime "$app"
codesign --verify --deep --strict --verbose=2 "$app"

echo "Patched and verified: $app"
