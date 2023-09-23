#!/usr/bin/env bash
python ~/Nextcloud/docs/battery_monitor/print_battery_level.py 1 >> ~/Nextcloud/docs/battery_monitor/battery_history.csv
grep 0 /sys/class/power_supply/AC/online > /dev/null && systemctl suspend-then-hibernate
