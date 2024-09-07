#!/usr/bin/env bash
swayidle -w timeout 500 'swaylock' \
            timeout 1000 'systemctl suspend' \
            before-sleep 'swaylock' &
