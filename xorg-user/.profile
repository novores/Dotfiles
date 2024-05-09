#!/bin/bash
export PATH=/usr/local/bin:$HOME/.local/bin:$PATH
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME=qt5ct

# # Trigger ~/.bashrc commands
# [[ -f ~/.bashrc ]] && . ~/.bashrc

#starts starx automatically on TTY1 
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] ; then 
  exec startx
fi
