#!/bin/env sh

pkill polybar


for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload i3wm_bar &
done
