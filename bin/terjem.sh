#!/usr/bin/env bash

# requirement : - bash 
#               - tranlate-shell
#               - notification-daemon eg. dunst
#               - xsel

set -e
LOG_FILE=$HOME/.terjem.log
TITLE="Translate Result"

copied() {
  if [[ $(command -v xsel) ]]; then
    xsel --output --clipboard
  else
    notify-send --urgency=critical "xsel package not found" "please install xsel" 
  fi
}
notify() {
  notify-send "$TITLE" "$RESULT"
}

# if no argument, then translate clip. if the clip is in the form of url it will open a browser.
if [ -z "$*" ]; then  
  RESULT=$(trans -brief "$(copied)") ; sleep 1; notify 
  echo "$(copied) > $RESULT" >> "$LOG_FILE"
  
elif [ "$1" == "en" ] || [ "$1" == "pl" ]; then
  RESULT=$(trans ":$1" -brief -join-sentence "${*:2}"); sleep 1; notify
  echo "[$(date +%s)] ${*:2} > $RESULT" >> "$LOG_FILE"
  
elif [ "$1" != "en" ]; then
  RESULT=$(trans -brief -join-sentence "$*"); sleep 1; notify 
  echo "[$(date +%s)] $* > $RESULT" >> "$LOG_FILE"
fi
