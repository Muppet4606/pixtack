# Pixtack

A lightweight screenshot, annotation and screen recording tool for Ubuntu-based Linux distros. Think ShareX, without the bloat: capture, mark up, copy or save, and record GIFs or video. Everything stays on your machine.

It is a single Python file (GTK3 and cairo) with no background service. It starts when you capture and exits when you are done.

## Features

- Region, full-screen and active-window screenshots, with an optional delay
- Editor: arrow, line, wavy line, free draw, rectangle, ellipse, text, blur, eraser, crop, rotate, border, undo/redo
- Copy to clipboard, quick save or save as PNG/JPEG
- GIF and MP4 screen recording of a region or the whole screen
- Global keyboard shortcuts (GNOME), changeable from within the app
- Works on X11 and Wayland

## Install

Download the latest `.deb` from the [Releases page](https://github.com/Muppet4606/pixtack/releases/latest), then from the download folder:

```
sudo apt install ./pixtack_*_all.deb
```

Using `apt install ./file.deb` (rather than `dpkg -i`) pulls in the recommended packages: ffmpeg for recording, wl-clipboard/xclip for a reliable clipboard, and the GStreamer PipeWire plugin for recording on Wayland. Screenshots alone only need packages that ship with a standard Ubuntu desktop.

To uninstall: `sudo apt remove pixtack`

## Keyboard shortcuts
Global keyboard shortcuts (GNOME) are off until you enable them, either from the Keyboard shortcuts window (button in the launcher, or F1 in the editor) or with:

```
pixtack --setup-shortcuts      # Super+Shift+S region, F full, G GIF, R video
pixtack --remove-shortcuts
```

To change a key, open the Keyboard shortcuts window, click the shortcut and press the new combination. Esc cancels and Backspace disables that one shortcut. Combinations already used by GNOME or another custom shortcut are refused, with the clashing action named. Your choices are kept if you disable and re-enable, and Reset to defaults restores the originals.

## Usage

Run `pixtack` (or open it from the app grid) for the small launcher, or call a mode directly:

| Command | Action |
|---|---|
| `pixtack --region` | Drag to select an area. Enter takes the whole monitor, Esc cancels |
| `pixtack --full` | All monitors |
| `pixtack --window` | Active window (X11). On Wayland the system picker opens |
| `pixtack --gif` / `--video` | Start a recording; run again to stop |
| `pixtack --stop` | Stop the current recording |
| `pixtack --open FILE` | Annotate an existing image |
| `--delay N` | Wait N seconds before capturing |

Right-clicking the dock icon also lists these actions.

## Editor

The toolbar sits centred along the top. New, Save as, Save and Copy sit centred under the image, with the keyboard shortcuts button (F1) at the bottom right. That window also has a one-click switch for the GNOME global shortcuts.

**Border** (in the toolbar) adds a border of your chosen width and colour around the outside of the image, so it never covers content. It is included when you copy or save, and your border settings are remembered.

**Editing annotations.** Anything you draw stays editable. A new shape is selected straight after drawing, so you can drag it or its handles immediately. Use the Select tool (V) to pick any earlier annotation. Double-click text to change it, press Delete to remove the selection, and use the arrow keys to nudge it (Shift moves 10 px). Changing the colour, width, font or fill while something is selected restyles it.

Tools (keyboard key in brackets): select (V), arrow (A), line (L), wavy line (W), free draw (P), rectangle (R), ellipse (E), text (T), blur (B), eraser (X), crop (C). Hold Shift for 45° lines, squares and circles. Rotate buttons sit beside undo/redo.

| Shortcut | Action |
|---|---|
| Ctrl+C | Copy to clipboard |
| Ctrl+Enter | Copy and close |
| Ctrl+S | Save PNG to ~/Pictures/Screenshots |
| Ctrl+Shift+S | Save as (PNG or JPEG) |
| Ctrl+Z / Ctrl+Shift+Z | Undo / redo |
| Ctrl+scroll, Ctrl+plus/minus, Ctrl+0 | Zoom |
| F5 | Retake |
| F1 or ? | Keyboard shortcuts |
| Esc | Close (asks first if there are unsaved edits) |

Recordings are saved to ~/Videos/Pixtack.

## Known limitations

- **Blur is not redaction.** Blurred or pixelated text can sometimes be recovered. For passwords, keys or client data, use a rectangle with Fill ticked.
- The eraser reveals the original screenshot beneath annotations. It works on a spot rather than on a particular annotation, so moving a shape away from an erased area shows it in full.
- Region selection works on one monitor at a time.
- Wayland recording uses the system screen-share dialog (pick the same monitor you selected on). The region is cropped afterwards; if you pick a window instead, the whole window is kept. Video is encoded to VP8 during capture and converted to MP4 when you stop, so long recordings take a moment to save.
- No audio capture.
- On Wayland, Active window uses the desktop's own screenshot UI.


## Troubleshooting

Run `pixtack --diagnose` for a summary of your setup: session type, available tools, global shortcut status (including clashes) and the latest log lines.

When Pixtack is started from a shortcut there is no terminal, so its output and any errors go to `~/.cache/pixtack/pixtack.log`. Every launch is recorded there, which shows whether a shortcut is reaching Pixtack at all.

## Building from source

```
git clone https://github.com/Muppet4606/pixtack.git
cd pixtack
sh build-deb.sh           # writes build/pixtack_<version>_all.deb
```

You can also run it without installing: `python3 src/pixtack`

## Releasing (maintainers)

1. Bump `VERSION` in `src/pixtack` and add an entry to `CHANGELOG.md`.
2. Commit, then either push a tag (`git tag v0.4.0 && git push origin main v0.4.0`) or create a release with a new tag such as `v0.4.0` on GitHub's Releases page.
3. GitHub Actions builds the package and attaches the `.deb` to the release.

## Licence

MIT. See [LICENSE](LICENSE).
