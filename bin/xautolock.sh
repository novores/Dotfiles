#!/bin/bash
xautolock \
  -time 7 -locker "betterlockscreen -l dim" -killtime 30 \
  -killer "loginctl suspend" -notify 30 \
  -notifier "notify-send 'NOTICE' 'sebentar lagi dikunci'" & \
