#!/usr/bin/env bash
AUDIO="/tmp/dictate.wav"

pw-record "$AUDIO" &
PID=$!

trap 'kill -INT $PID 2>/dev/null' EXIT
read -r

TEXT=$(whisper-cpp -m ~/.local/share/whisper/ggml-base.en.bin -f "$AUDIO" --no-timestamps -nt)
echo "$TEXT" | wtype -

