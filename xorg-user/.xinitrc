#!/bin/bash

# if which dbus-launch > /dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
#   eval 'dbus-launch --sh-syntax --exit-with-session'
# fi

#start dwm
dbus-update-activation-environment --all
xrdb ~/.Xresources
# exec ~/.local/bin/startdwm
# wmname "LG3D"

# exec awesome >/tmp/awesomewm-log 2>&1
# exec startxfce4
# # exec ~/.config/chadwm/scripts/run.sh
exec bspwm
#
# ## start budgie
# # export XDG_CURRENT_DESKTOP=Budgie:GNOME
# # exec budgie-desktop
#
# # start plasma
# export DESKTOP_SESSION=plasma
# exec startplasma-x11

#start gnome
# export XDG_SESSION_TYPE=x11
# export GDK_BACKEND=x11
# exec gnome-session
