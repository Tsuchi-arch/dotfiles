#!/usr/bin/env bash
# Symlinks every config in <package>/.config/<name> into ~/.config/<name>.
# Existing real folders are backed up first, never deleted.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.config" "$HOME/Pictures/Wallpapers"

for src in "$REPO"/*/.config/*; do
    [ -e "$src" ] || continue
    name="$(basename "$src")"
    dest="$HOME/.config/$name"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        backup="$dest.bak.$(date +%Y%m%d_%H%M%S)"
        mv "$dest" "$backup"
        echo "Backed up existing $dest -> $backup"
    fi

    ln -sfn "$src" "$dest"
    echo "Linked $dest -> $src"
done

# Wallpapers (used by hyprlock and waypaper)
cp -n "$REPO"/wallpapers/* "$HOME/Pictures/Wallpapers/" 2>/dev/null || true

# Make sure helper scripts are executable
chmod +x "$REPO"/hypr/.config/hypr/scripts/* 2>/dev/null || true

echo "Done. Log out and back into Hyprland (or run: hyprctl reload)."
