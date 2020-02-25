#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
export DISPLAY=:0

status=$(cat /sys/class/power_supply/BAT0/status)
level=$(cat /sys/class/power_supply/BAT0/capacity)
nagbar_running=$(pgrep i3-nagbar)


if [ $status == Discharging ] ; then
  if [ $level -lt 10 ] && [ -z "$nagbar_running" ] ; then
    i3-nagbar -m "Battery below 10%"
  fi
  if [ $level -lt 5 ] ; then
    systemctl hibernate
  fi
fi

