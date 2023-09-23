#!/usr/bin/env bash
backlight_percent=$(echo `xbacklight`)
backlight_percent_rounded=$(printf "%.0f" $backlight_percent)
dunstify -h string:x-dunst-stack-tag:brightness "Brightness: $backlight_percent_rounded%"

