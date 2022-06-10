#!/bin/sh
WALLPAPERS=$(xdg-user-dir PICTURES)/Wallpapers/
DMENU="rofi -dmenu -i -p wal"

choice=$(ls -A $WALLPAPERS | $DMENU)

if [ $? == 0 ]; then
    wal --saturate 0.6 -i $WALLPAPERS/$choice
fi
