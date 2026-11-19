#!/bin/bash
set -eu
MYB_DOWNLOAD_DIR="$(CDPATH= cd -- "$(dirname "$0")" && pwd)"
cd "$MYB_DOWNLOAD_DIR"
if [ "$(uname -s)" != Darwin ]; then echo "Dieser Starter ist fuer macOS."; exit 1; fi
if [ ! -f ".mac-ready-5d9f9a2" ] || [ ! -x "MindYourBusiness-mac/Mind Your Business.app/Contents/MacOS/Mind Your Business" ]; then
  echo "Mind Your Business wird einmalig entpackt. Bitte kurz warten."
  /bin/cat "Mac-Universal-1.0.5-5d9f9a2.tar.xz".0* > "Mac-Universal-1.0.5-5d9f9a2.tar.xz"
  /usr/bin/tar -xf "Mac-Universal-1.0.5-5d9f9a2.tar.xz" -C "$MYB_DOWNLOAD_DIR"
  rm -f "Mac-Universal-1.0.5-5d9f9a2.tar.xz"
  test -x "MindYourBusiness-mac/Mind Your Business.app/Contents/MacOS/Mind Your Business"
  touch ".mac-ready-5d9f9a2"
fi
open "$MYB_DOWNLOAD_DIR/MindYourBusiness-mac/Mind Your Business.app" --args "$@"
