#!/usr/bin/env python3
import os
import sys
import configparser
import subprocess

# 1. Read Waypaper config file safely
config = configparser.ConfigParser()
config_path = os.path.expanduser("~/.config/waypaper/config.ini")

if not os.path.exists(config_path):
    print(f"Error: Waypaper config not found at {config_path}")
    sys.exit(1)

config.read(config_path)

# Target your exact configuration block
section = 'Settings'

if section not in config:
    print(f"Error: Could not find [{section}] section in config.ini")
    sys.exit(1)

try:
    # Read variables and force path expansion (turns ~/Pictures into /home/you/Pictures)
    folder = os.path.expanduser(config[section]['folder'])
    current_wall = os.path.expanduser(config[section]['wallpaper'])
except KeyError as e:
    print(f"Error: Missing expected configuration key: {e}")
    sys.exit(1)

# 2. Extract valid image and video formats from your directory
valid_exts = ('.jpg', '.jpeg', '.png', '.webp', '.gif', '.mp4', '.webm')

if not os.path.exists(folder):
    print(f"Error: Wallpaper directory '{folder}' does not exist.")
    sys.exit(1)

files = sorted([os.path.join(folder, f) for f in os.listdir(folder) if f.lower().endswith(valid_exts)])

if not files:
    print(f"Error: No valid wallpapers found in {folder}")
    sys.exit(1)

# 3. Handle sequential positioning
try:
    current_index = files.index(current_wall)
    next_index = (current_index + 1) % len(files)
except ValueError:
    # If current wallpaper isn't found or path notation differs, start from the beginning
    next_index = 0

next_wallpaper = files[next_index]

# 4. Trigger Waypaper to update cleanly
subprocess.run(["waypaper", "--wallpaper", next_wallpaper])
print(f"Success: Swapped wallpaper to {os.path.basename(next_wallpaper)}")
