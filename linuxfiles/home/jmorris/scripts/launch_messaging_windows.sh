#!/bin/bash
# checks to make sure google WPA messaging apps are always up
# see i3 config for more information
# add to cron
grep -Po 'class="Google-chrome" instance="crx_\K.*(?=")' ~/.config/i3/config | while read -r line; do
    #echo $line
    if [[ ! $(xdotool search -classname $line) ]]; then
        google-chrome-stable --profile-directory=Default --app-id=$line &
    fi
done
