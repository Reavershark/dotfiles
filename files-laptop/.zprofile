#PATH="/usr/sbin:/sbin:/bin:/usr/games:$PATH"
export MOZ_USE_XINPUT2=1
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:/opt/android-sdk/platform-tools
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
if [ ! -e /tmp/.autostartx.lock ] && [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  touch /tmp/.autostartx.lock
  mkdir /dev/shm/$USER
  startx /usr/bin/i3 &> /dev/null
  exit
fi
