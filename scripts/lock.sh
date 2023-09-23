#!/bin/sh
set -e
bgimage=$(cat ~/.config/nitrogen/bg-saved.cfg | grep file | cut -f2 -d "=")
#i3lock --nofork --show-failed-attempts --ignore-empty-password --image=$bgimage
# install betterlockscreen from aur
# then run betterlockscreen -u <location of lockscreen image> to generate images
betterlockscreen -l dim -- --composite
xset dpms
