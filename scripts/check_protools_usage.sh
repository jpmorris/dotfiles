#!/usr/bin/env bash

days_since_activity=$(ssh root@bebop "find /mnt/user/anna/Music/proToolsFiles -maxdepth 1 -mindepth 1  -printf '%T+\n' | sort -rn | head -n 1 | cut -d+ -f1 | xargs -I {} date -d{} +%s  | awk '{print (int(systime()) - \$1) / 86400}'")

if (( $(echo "$days_since_activity < 10" |bc -l) )); then
    dig +short myip.opendns.com @resolver1.opendns.com | xargs -I\% curl -fsS -m 10 --retry 5 --data-raw "\%" https://hc-ping.com/036dc0cc-3270-42e8-8753-09b58f87457d
fi
