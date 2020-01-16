#!/bin/bash

ONAC=`cat /sys/class/power_supply/AC/online`
if [[ "ONAC" -eq 0 ]]; then
    systemctl suspend
else
    # xautolock -reset
    # to get around xautolock bug
    pkill xautolock
    xautolock -detectsleep \
        -time 10 -locker "i3lock -nc 000000" \
        -killtime 20 -killer "/opt/suspend.sh" \
        -corners ---+ &
fi
