#!/bin/sh

if [ "$(pgrep -x compton)" ]; then
    pkill compton
else
    compton -b --conf ~/.compton.conf
fi
