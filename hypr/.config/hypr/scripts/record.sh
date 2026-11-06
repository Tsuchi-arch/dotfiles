#!/bin/bash

PID_FILE="/tmp/gpu-recorder.pid"
STATUS_FILE="/tmp/recording.status"
START_FILE="/tmp/recording.start"
OUT_DIR="$HOME/Videos/Recordings"
mkdir -p "$OUT_DIR"

stop_recording() {
    PID=$(cat "$PID_FILE")

    if ps -p "$PID" > /dev/null 2>&1; then
        kill -INT "$PID"
    fi

    rm -f "$PID_FILE" "$STATUS_FILE" "$START_FILE"
    notify-send "󰑊 Recording" "Stopped"
}

start_recording() {
    FILENAME="$OUT_DIR/recording-$(date +%Y-%m-%d_%H-%M-%S).mp4"

    gpu-screen-recorder \
        -w screen \
        -f 60 \
        -o "$FILENAME" \
        -a default_output \
        -c mp4 \
        &

    echo $! > "$PID_FILE"
    date +%s > "$START_FILE"
    touch "$STATUS_FILE"

    notify-send "󰑊 Recording" "Started"
}

if [ -f "$PID_FILE" ]; then
    stop_recording
else
    start_recording
fi