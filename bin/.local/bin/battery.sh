#!/bin/dash

while true
do
   battery_level=`acpi -b | grep -P -o '\d+(?=%)'`
   if [ $(cat /sys/class/power_supply/AC/online) = 0 ];then
 if [ $battery_level -le 30 ]
     then
         dunstify "Battery is low: $battery_level%"; paplay /usr/share/sounds/freedesktop/stereo/bell.oga
     fi
   fi
   sleep 300 #every 5 minutes
done

# vim:ft=bash
