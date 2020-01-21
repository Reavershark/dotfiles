#!/bin/zsh

set -e

2>/dev/null devices_arr=($(dbus-send --session --print-reply=literal --dest="org.kde.kdeconnectd" /modules/kdeconnect org.kde.kdeconnect.daemon.devices))
2>/dev/null device=${devices_arr[3]}
2>/dev/null battery_arr=($(dbus-send --session --print-reply=literal --dest="org.kde.kdeconnectd" /modules/kdeconnect/devices/$device org.kde.kdeconnect.device.battery.charge))
2>/dev/null charger_arr=($(dbus-send --session --print-reply=literal --dest="org.kde.kdeconnectd" /modules/kdeconnect/devices/$device org.kde.kdeconnect.device.battery.isCharging))

battery_percent=${battery_arr[2]}
ac=${charger_arr[2]}

if [ "$ac" = "true" ]; then
    echo "$battery_percent%!"
else
    echo "$battery_percent%"
fi
