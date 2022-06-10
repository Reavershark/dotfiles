#!/bin/sh
capture=~/.i3/capture
case "$1" in
    fullscreen|region|objects)
        timestamp=$(date +%Y-%m-%d_%H-%M-%S)
        png=~/Pictures/Screenshots/screenshot-$timestamp.png
        jpeg=~/Pictures/Screenshots/screenshot-$timestamp.jpeg
        $capture $1 png > $png

	if [ $? != 0 ]; then
		rm $png
		exit 1
	fi
        
        #file $png

        convert $png $jpeg
        xclip -selection clipboard -t image/png $png &
        disown %xclip
        ;;
    *)
        echo invalid argument
        exit 1
        ;;
esac
