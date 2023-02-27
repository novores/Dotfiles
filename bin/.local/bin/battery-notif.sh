#!/bin/dash

while true; do
  case "$(cat /sys/class/power_supply/AC/online)" in
    1) dunstify "Charging";espeak -s 160 -g 12 -v id "Mengecas" -k 20
    ;;
    0) if [ "$(cat /sys/class/power_supply/BAT0/capacity)" -le 10 ]; then
        dunstify "low battery"; espeak -s 160 -g 12 -v id "Baterai lemah" -k 20
       fi
  esac
  sleep 120
done
