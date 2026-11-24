#!/bin/sh
# Builds pixtack_<version>_all.deb from this source tree.
set -eu
# Edit this before publishing (shown in the package metadata).
MAINTAINER="${MAINTAINER:-Muppet4606 <349731203+Muppet4606@users.noreply.github.com>}"
cd "$(dirname "$0")"
VERSION=$(sed -n 's/^VERSION = "\(.*\)"/\1/p' src/pixtack)
ROOT=build/pixtack_${VERSION}_all
rm -rf build && mkdir -p "$ROOT/DEBIAN" "$ROOT/usr/bin" "$ROOT/usr/share/applications" \
  "$ROOT/usr/share/icons/hicolor/scalable/apps" "$ROOT/usr/share/doc/pixtack"
install -m 0755 src/pixtack "$ROOT/usr/bin/pixtack"
install -m 0644 data/pixtack.desktop "$ROOT/usr/share/applications/pixtack.desktop"
install -m 0644 data/pixtack.svg "$ROOT/usr/share/icons/hicolor/scalable/apps/pixtack.svg"
install -m 0644 README.md "$ROOT/usr/share/doc/pixtack/README.md"
install -m 0644 LICENSE "$ROOT/usr/share/doc/pixtack/copyright"
SIZE=$(du -sk --exclude=DEBIAN "$ROOT" | cut -f1)
cat > "$ROOT/DEBIAN/control" <<CTRL
Package: pixtack
Version: ${VERSION}
Section: graphics
Priority: optional
Architecture: all
Installed-Size: ${SIZE}
Depends: python3 (>= 3.8), python3-gi, python3-gi-cairo, python3-cairo, gir1.2-gtk-3.0, gir1.2-pango-1.0
Recommends: ffmpeg, wl-clipboard, xclip, gir1.2-gstreamer-1.0, gstreamer1.0-pipewire, gstreamer1.0-plugins-good, xdg-desktop-portal, libnotify-bin
Maintainer: ${MAINTAINER}
Description: Lightweight screenshot, annotation and screen recording tool
 Region, full-screen and window screenshots with a small editor (text, crop,
 blur, rectangle, ellipse, eraser, line, wavy line, arrow, free draw, rotate),
 clipboard copy and save, plus GIF and MP4 screen recording.
 Works on X11 and Wayland (via xdg-desktop-portal and PipeWire).
CTRL
dpkg-deb --root-owner-group --build "$ROOT" >/dev/null
echo "$ROOT.deb"
