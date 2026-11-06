#!/usr/bin/env bash
BUS="1"
STEP=5

# 1. Instantly read the current value from a cached file, or pull fresh if empty
CACHE_FILE="/tmp/monitor_brightness_cache"
if [ ! -f "$CACHE_FILE" ]; then
    CURRENT_VAL=$(ddcutil --bus="$BUS" --brief getvcp 10 | awk '{print $4}')
    echo "$CURRENT_VAL" > "$CACHE_FILE"
else
    CURRENT_VAL=$(cat "$CACHE_FILE")
fi

# 2. Mathematically calculate the new target level instantly
NEW_VAL=$((CURRENT_VAL + STEP))
[ "$NEW_VAL" -gt 100 ] && NEW_VAL=100
echo "$NEW_VAL" > "$CACHE_FILE"

# 3. Fire the notification banner IMMEDIATELY with zero lag
notify-send -h string:x-canonical-private-synchronous:brightness \
            -h int:value:"$NEW_VAL" \
            "Monitor Brightness" \
            "Current level: ${NEW_VAL}%" \
            -i display

# 4. Push the hardware command to the monitor safely in the background
ddcutil --bus="$BUS" --brief --sleep-multiplier .1 setvcp 10 "$NEW_VAL" > /dev/null 2>&1 &
