#!/bin/bash

if pgrep -f "pavucontrol" > /dev/null; then
    pkill -f "pavucontrol"
else
    pavucontrol &
fi