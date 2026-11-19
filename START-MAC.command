#!/bin/bash
set -eu
MYB_DOWNLOAD_DIR="$(CDPATH= cd -- "$(dirname "$0")" && pwd)"
cd "$MYB_DOWNLOAD_DIR"
if [ "$(uname -s)" != "Darwin" ]; then
  echo "Dieser Starter ist fuer macOS auf Apple Silicon."
  exit 1
fi
if [ ! -f ".mac-ready-a27d603" ] || [ ! -x "MindYourBusiness-mac-arm64-local/runtime/Electron.app/Contents/MacOS/Electron" ]; then
  echo "Mind Your Business wird einmalig entpackt. Bitte kurz warten."
  if [ ! -f "Mac-AppleSilicon-a27d603.tar.xz" ]; then /bin/cat "Mac-AppleSilicon-a27d603.tar.xz".0* > "Mac-AppleSilicon-a27d603.tar.xz"; fi
  /usr/bin/tar -xf "Mac-AppleSilicon-a27d603.tar.xz" -C "$MYB_DOWNLOAD_DIR"
  if ls "Mac-AppleSilicon-a27d603.tar.xz".0* >/dev/null 2>&1; then rm -f "Mac-AppleSilicon-a27d603.tar.xz"; fi
  test -x "MindYourBusiness-mac-arm64-local/runtime/Electron.app/Contents/MacOS/Electron"
  touch ".mac-ready-a27d603"
fi
# Downloaded with a browser, the archive and everything unpacked from it carry the quarantine mark, and macOS then
# reports the unsigned runtime as damaged. The player has already allowed this starter, so it clears the mark from
# its own folder (each start, in case it was unpacked by an older starter).
/usr/bin/xattr -dr com.apple.quarantine "MindYourBusiness-mac-arm64-local" 2>/dev/null || true
exec "$MYB_DOWNLOAD_DIR/MindYourBusiness-mac-arm64-local/Mind Your Business starten.command" "$@"
