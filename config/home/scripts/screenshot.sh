#!/usr/bin/sh

SAVE_DIR="$HOME/Desktop/screenshots"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FILENAME="screenshot_$TIMESTAMP.png"
FULL_PATH="$SAVE_DIR/$FILENAME"

gnome-screenshot -a -f "$FULL_PATH"

xclip -selection clipboard -t image/png -i "$FULL_PATH"

notify-send "Screenshot Taken" "Saved to $FULL_PATH and copied to clipboard."