#!/bin/bash
export PATH=/usr/local/bin:$HOME/.local/bin:$PATH
export QT_QPA_PLATFORMTHEME=qt5ct

# Trigger ~/.bashrc commands
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] ; then 
  exec startx
fi
