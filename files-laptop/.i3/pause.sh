#!/bin/sh
[ $(ps -o stat $(xdotool getactivewindow getwindowpid) | tail -n1 | cut -c1) = 'T' ] && kill -CONT $(xdotool getactivewindow getwindowpid) || kill -STOP $(xdotool getactivewindow getwindowpid)
