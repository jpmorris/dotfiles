#!/bin/bash
bat=$(acpi -a)
# if outside of working hours then ignore
hour=$(date +"%H")

if [ $hour -gt 18 ] || [ $hour -lt 8 ]; then
    exit
fi

if [ "$bat" = "Adapter 0: on-line" ]; then
# if on power then just lock
  i3lock -n -c 000000
else
# if on battery then sleep
  systemctl suspend
fi
