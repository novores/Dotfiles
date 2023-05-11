#!/bin/sh

# if which dbus-launch > /dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
#   eval 'dbus-launch --sh-syntax --exit-with-session'
# fi
dbus-update-activation-environment --all
exec ~/.local/bin/startdwm

# export XDG_SESSION_TYPE=x11
# export GDK_BACKEND=x11
# exec gnome-session
