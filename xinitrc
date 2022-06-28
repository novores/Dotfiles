#!/bin/sh
if which dbus-launch > /dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
  eval 'dbus-launch --sh-syntax --exit-with-session'
fi

while true;do
  /usr/local/bin/dwm 2> ~/.dwm.log
done

# exec dbus-run-session bspwm
# while type dwm >/dev/null; do dwm && continue || break; done
