#!/usr/bin/env bash

MODEL_PATH="$HOME/.local/share/whisper-models/ggml-small.en.bin"
AUDIO_FILE="/tmp/dictate.wav"

rec -q -r 16000 -c 1 -b 16 "$AUDIO_FILE" trim 0 30 2>/dev/null
TEXT=$(whisper-cpp -m "$MODEL_PATH" -f "$AUDIO_FILE" --no-timestamps -nt 2>/dev/null)
CLEAN_TEXT=$(echo "$TEXT" | xargs)
if [ -n "$CLEAN_TEXT" ]; then
    wtype "$CLEAN_TEXT "
fi
rm -f "$AUDIO_FILE"
