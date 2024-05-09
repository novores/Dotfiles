#!/usr/bin/dash
export PATH=$HOME/.cargo/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# env for dwm
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME=qt5ct

#starts starx automatically on TTY1 
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ] ; then 
  exec startx
fi
