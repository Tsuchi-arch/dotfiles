#!/usr/bin/env bash
BUS="1"
STEP=5

CACHE_FILE="/tmp/monitor_brightness_cache"
if [ ! -f "$CACHE_FILE" ]; then
    CURRENT_VAL=$(ddcutil --bus="$BUS" --brief getvcp 10 | awk '{print $4}')
    echo "$CURRENT_VAL" > "$CACHE_FILE"
else
    CURRENT_VAL=$(cat "$CACHE_FILE")
fi

NEW_VAL=$((CURRENT_VAL - STEP))
[ "$NEW_VAL" -lt 0 ] && NEW_VAL=0
echo "$NEW_VAL" > "$CACHE_FILE"

notify-send -h string:x-canonical-private-synchronous:brightness \
            -h int:value:"$NEW_VAL" \
            "Monitor Brightness" \
            "Current level: ${NEW_VAL}%" \
            -i display

ddcutil --bus="$BUS" --brief --sleep-multiplier .1 setvcp 10 "$NEW_VAL" > /dev/null 2>&1 &
