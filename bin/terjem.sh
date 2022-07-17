#!/bin/sh
# simple script as a translation tool using translate-shell, I use it on dmenu 

if [ -z $1 $2 ]; then  
  notify-send "[ERROR]" "Put text for translating" -u critical
elif [ -z $2 ]; then
  x=$(trans -b "$1"); notify-send "Translate Result" "$x"
elif [ -n $2 ]; then
  x=$(trans ":$1" -b "$2"); notify-send "Translate Result" "$x"
fi
  
