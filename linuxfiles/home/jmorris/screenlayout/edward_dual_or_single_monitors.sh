#!/bin/bash



function ActivateDual {
    echo "Switching to DUAL MONITORS"
    xrandr --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output HDMI-0 --mode 1920x1080 --pos 2560x0 --rotate normal --output DP-4 --off --output DP-5 --off --output eDP-1-1 --mode 2560x1440 --pos 0x0 --rotate normal
}
function ActivateSingle {
    echo "Switching to LAPTOP ONLY"
    xrandr --output eDP-1 --mode 2560x1440 --pos 0x0 --rotate normal
}

function HDMIConnected {
    xrandr | grep "^HDMI-0" | grep connected
}

## MONITOR doesn't do anything because it's not preserved between script executions
# actual script
##while true
##do
    if HDMIConnected
    then
        ActivateDual
    fi

    if ! HDMIConnected
    then
        ActivateSingle
    fi

    ##sleep 1s
##done

