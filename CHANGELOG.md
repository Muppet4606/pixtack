# Changelog

## 0.4.0
- Annotations can be selected, moved and resized. Use the new Select tool (V), or adjust a shape straight after drawing it.
- Double-click text to edit it. Delete removes the selection, and the arrow keys nudge it (Shift for 10 px).
- Changing colour, width, font or fill while an annotation is selected restyles it.
- Crop and rotate no longer flatten the image, so annotations stay editable afterwards.
- The launcher offers to enable global shortcuts when they are off.
- New `pixtack --diagnose` command for troubleshooting.
- Errors are logged to `~/.cache/pixtack/pixtack.log` and shown as notifications when Pixtack is started from a shortcut.

## 0.3.1
- Renamed from Snipkit to Pixtack (command, package, settings folder and shortcut entries).

## 0.3.0
- Global shortcuts can be changed from the Keyboard shortcuts window: click a shortcut and press new keys.
- Clashes with GNOME or other custom shortcuts are detected and named.
- Fixed: closing the editor no longer overwrites other saved settings.

## 0.2.0
- Toolbar centred at the top; New, Save as, Save and Copy moved under the image.
- Border option (width and colour) added around the outside of the image.
- Keyboard shortcuts window (F1) with one-click GNOME global shortcuts.

## 0.1.0
- First release: region, full-screen and window capture; editor with arrow, line, wavy line, free draw, rectangle, ellipse, text, blur, eraser, crop and rotate; copy and save; GIF and MP4 recording on X11 and Wayland.
