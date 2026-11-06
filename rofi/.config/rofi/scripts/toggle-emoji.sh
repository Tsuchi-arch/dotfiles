#!/bin/bash

THEME="/home/jef/.config/rofi/launchers/type-1/style-5-emoji.rasi"

pkill rofi || rofi -modi emoji \
     -show emoji \
     -theme "$THEME"