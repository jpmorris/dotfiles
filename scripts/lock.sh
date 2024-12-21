#!/bin/sh
set -e
bgimage=~/dotfiles/ansible/roles/linux_i3/files/feh/brooklyn_bridge_at_night-wallpaper-7680x1440.jpg
#i3lock --nofork --show-failed-attempts --ignore-empty-password --image=$bgimage
# install betterlockscreen from aur
# then run betterlockscreen -u <location of lockscreen image> to generate images
# incognito kill
ps aux | grep chrom  | grep 'disable-databases'| awk '{print $2}' | xargs -r kill -9
betterlockscreen -l dim -- --composite
xset dpms
