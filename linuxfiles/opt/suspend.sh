#!/bin/bash

ONAC=`cat /sys/class/power_supply/AC/online`
if [[ "ONAC" -eq 0 ]]; then
    systemctl suspend
fi
