#!/bin/bash

if pgrep -x rofi > /dev/null; then
    pkill rofi
    exit 0
fi

selection=$(cliphist list | rofi -dmenu -theme /home/jef/.config/rofi/launchers/type-1/style-5-clipboard.rasi)

[ -z "$selection" ] && exit 0

echo "$selection" | cliphist decode | wl-copy