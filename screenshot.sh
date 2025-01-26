#!/usr/bin/sh

sudo apt install gnome-screenshot xclip

mkdir -p ~/.scripts
cp ./config/home/scripts/screenshot.sh ~/.scripts/screenshot.sh
chmod +x ~/.scripts/screenshot.sh

# Now screenshots can be done in terminal using the command:
# sh -c "~/.scripts/screenshot.sh"
# Go to Settings -> Keyboard -> View and Customize Settings -> Custom Shortcuts 
# And create a new one with this command, Window + Shift + S key matches Windows equivalent