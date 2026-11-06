# Hyprland rice

My Hyprland setup: scrolling layout, rounded blurred windows, special workspaces for chat / music / files / terminal, and a Gruvbox-ish lock screen.

<!-- Add a screenshot: put it in screenshots/ and uncomment the line below -->
<!-- ![desktop](screenshots/desktop.png) -->

## What's in here

```
hypr/.config/hypr/
├── hyprland.lua          # entry point, requires the modules below
├── modules/
│   ├── monitors.lua      # display + persistent workspaces
│   ├── binds.lua         # keybindings
│   ├── autostart.lua     # startup programs
│   ├── env.lua           # environment variables (Nvidia, Wayland, Qt)
│   ├── decorations.lua   # gaps, borders, blur, animations
│   ├── layout.lua        # scrolling layout
│   ├── input.lua         # keyboard, mouse, gestures
│   ├── misc.lua
│   └── windowrules.lua   # window + layer rules, special-workspace routing
├── scripts/              # brightness (ddcutil), wallpaper cycle, screen record, pavucontrol toggle
├── hypridle.conf
├── hyprlock.conf
└── colors.conf
wallpapers/               # nicesky.webp
docs/                     # old notes
install.sh                # symlinks configs into ~/.config
```

## Requirements

Needs a **recent Hyprland with Lua config support** (`hyprland.lua` uses the `hl.*` API).

| Purpose | Packages |
|---|---|
| Core | `hyprland` `hypridle` `hyprlock` `hyprpicker` `xdg-desktop-portal-hyprland` |
| Shell | `waybar` `swaync` `rofi` `kitty` `thunar` `polkit-kde-agent` |
| Wallpaper | `waypaper` |
| Screenshots / recording | `grim` `slurp` `swappy` `gpu-screen-recorder` |
| Clipboard | `wl-clipboard` `cliphist` |
| Audio / media | `pavucontrol` `easyeffects` `playerctl` (`wpctl` from PipeWire) |
| Brightness | `brightnessctl` `ddcutil` |
| Misc | `openrgb` `btop` `firefox` `steam` `spotify-launcher` |
| Font | `ttf-jetbrains-mono-nerd` |

## Install

```bash
git clone https://github.com/YOURUSER/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` backs up any existing `~/.config/hypr` to `hypr.bak.<timestamp>` and symlinks the repo version in its place. Prefer GNU Stow? `stow hypr` from the repo root works too, since the layout matches.

## Things to adjust for your machine

- **Monitor:** `modules/monitors.lua` is set for `HDMI-A-1` at 1920x1080@120, 10-bit, `dcip3`. Run `hyprctl monitors` and edit it.
- **Nvidia:** `modules/env.lua` sets `GBM_BACKEND` and `__GLX_VENDOR_LIBRARY_NAME`. Remove those two lines on AMD/Intel.
- **Monitor brightness:** the scripts in `scripts/` use `ddcutil --bus=1`. Find your bus with `ddcutil detect`, and make sure `i2c-dev` is loaded and your user can access `/dev/i2c-*`.
- **Motion blur:** `decorations.lua` has a `motion_blur` block. If your Hyprland build or plugin doesn't support it, delete that block.
- **Lock screen avatar:** `hyprlock.conf` reads `~/.face`. Put a square image there or remove the `image {}` block.
- **Binds that call other configs:** the launcher, clipboard, emoji picker, calculator and waybar-launch binds expect scripts under `~/.config/rofi/` and `~/.config/waybar/`. Those aren't in this repo yet.
- **Autostart:** `modules/autostart.lua` launches Steam, OpenRGB and EasyEffects. Remove what you don't use.

## Keybinds (main mod = `SUPER`)

| Keys | Action |
|---|---|
| `Return` | Terminal (kitty) |
| `Z` | App launcher (rofi) |
| `W` / `E` / `C` | Firefox / Thunar / VSCodium |
| `D` / `M` | Discord / Spotify (special workspaces) |
| `Q` | Close window |
| `F` | Fullscreen |
| `ALT+Space` | Toggle floating |
| `V` | Clipboard history |
| `/` | Emoji picker |
| `N` | Notification center |
| `SHIFT+S` / `PRINT` | Screenshot (area / full) with swappy |
| `ALT+R` | Start/stop screen recording |
| `SHIFT+L` | Lock screen |
| `SHIFT+W` | Next wallpaper |
| `S` | Scratchpad |
| `F1`-`F8` | Toggle special workspaces (`SHIFT+F#` moves the window there) |
| `CTRL+ALT+V` | Toggle pavucontrol |
| `SUPER+Volume dial` | External monitor brightness |

## Credits

Wallpaper: `nicesky.webp`. Config structure based on the Hyprland default config.
