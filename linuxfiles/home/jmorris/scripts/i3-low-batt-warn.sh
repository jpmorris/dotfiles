#!/bin/sh
acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
	read -r status capacity

	if [ "$status" = Discharging -a "$capacity" -lt 10 ]; then
	  i3-nagbar -m "Battery below 10%"
	fi
}
