#!/usr/bin/env bash

# requirement : - bash 
#               - tranlate-shell
#               - notification-daemon eg. dunst
#               - xsel

set -e
LOG_FILE=$HOME/.terjem.log
TITLE="Translate Result"
notiduration=10000
LANG=(id en pl in fr)

copied() {
  if [[ $(command -v xsel) ]]; then
    xsel --output --clipboard
  else
    notify-send --urgency=critical "xsel package not found" "please install xsel" 
  fi
}
notify() {
  notify-send -t $notiduration "$TITLE" "$RESULT"
}

# if no argument, then translate clip. if the clip is in the form of url it will open a browser.
if [[ -z "$*" ]]; then  
  RESULT=$(trans -brief :id "$(copied)") ; sleep 1; notify 
  echo "$(copied) > $RESULT" >> "$LOG_FILE"
  
elif [[ "$2" -eq "$LANG" ]]; then
  RESULT=$(trans ":$1" -brief -join-sentence "${*:2}"); sleep 1; notify
  echo "[$(date +%s)] ${*:2} > $RESULT" >> "$LOG_FILE"
  
else 
  RESULT=$(trans -brief -join-sentence "$*"); sleep 1; notify 
  echo "[$(date +%s)] $* > $RESULT" >> "$LOG_FILE"
  
fi
