#!/bin/bash

# if which dbus-launch > /dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
#   eval 'dbus-launch --sh-syntax --exit-with-session'
# fi
#start dwm
dbus-update-activation-environment --all
xrdb ~/.Xresources
# exec startxfce4
exec ~/.local/bin/startdwm
# exec herbstluftwm --locked
# start plasma
# export DESKTOP_SESSION=plasma
# exec startplasma-x11

#start gnome
# export XDG_SESSION_TYPE=x11
# export GDK_BACKEND=x11
# exec gnome-session
