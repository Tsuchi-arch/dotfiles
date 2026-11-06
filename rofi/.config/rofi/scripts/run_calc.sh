#!/bin/bash
# Kill the current rofi instance to avoid conflicts
pkill rofi || rofi -show calc \
     -modi calc \
     -theme "/home/jef/.config/rofi/launchers/type-1/style-5-calc.rasi"