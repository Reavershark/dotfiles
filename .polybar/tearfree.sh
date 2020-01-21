#!/bin/sh

if [ -e /tmp/.tearfree.lock ]; then
    rm /tmp/.tearfree.lock
    xrandr --output DisplayPort-0 --set "TearFree" auto
else
    touch /tmp/.tearfree.lock
    xrandr --output DisplayPort-0 --set "TearFree" on
fi
