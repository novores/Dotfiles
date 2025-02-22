#!/usr/bin/dash
export FLYCTL_INSTAL=/home/novores/.fly
export PATH=$FLYCTL_INSTAL/bin:$HOME/.cargo/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# env for dwm
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME=qt5ct
# starts WM/DM automatically on TTY1 
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ] ; then 
   exec Hyprland
   # startx
fi
