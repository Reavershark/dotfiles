export PATH=$PATH:/home/jonas/.local/bin
export XDG_RUNTIME_DIR="/run/user/$UID"
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
export XCURSOR_SIZE=41
export TERMINAL=urxvt
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export OCL_ICD_VENDORS=mesa

if [ ! -e /tmp/.zshfirststart ] && [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  mkdir /dev/shm/$USER
  touch /tmp/.zshfirststart
  startx /usr/bin/i3
  exit
fi
