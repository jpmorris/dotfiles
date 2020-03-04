#!/bin/bash

# you need to modify /etc/lightdm/lightdm.conf for the 'startup script' to run this at lightdm start


function ActivateDual {
    echo "Switching to DUAL MONITORS"
    xrandr --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output HDMI-0 --mode 1920x1080 --pos 2560x0 --rotate normal --output DP-4 --off --output DP-5 --off --output eDP-1-1 --mode 2560x1440 --pos 0x0 --rotate normal
}
function ActivateTriple {
    echo "Switching to TRIPLE MONITORS"
    xrandr --output eDP-1 --mode 2560x1440 --pos 3840x0 --rotate normal --output DVI-I-3-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-I-2-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
}

function ActivateIntelSingle {
    echo "Switching to LAPTOP ONLY - INTEL"
    #xrandr --output eDP-1 --mode 2560x1440 --pos 0x0 --rotate normal
    xrandr --output eDP-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DVI-I-3-2 --off --output DVI-I-2-1 --off

}

function ActivateNVIDIASingle {
    echo "Switching to LAPTOP ONLY - NVIDIA"
    xrandr --output eDP-1-1 --mode 2560x1440 --pos 0x0 --rotate normal
}

function HDMIConnected {
    xrandr | grep "^HDMI-0 connected"
}
function DockConnected {
    xrandr | grep "^DVI-I-2-1 connected"
}

function NVIDIADetected {
    xrandr | grep "^eDP-1-1"
}

# HDMI is connected
if DockConnected
then
    ActivateTriple
fi
# HDMI is not connected
if ! DockConnected
then
  # NVIDIA drivers loaded so laptop display is named eDP-1-1
  if NVIDIADetected
  then
    ActivateNVIDIASingle
  # Intel drivers loaded so laptop display is named eDP-1
  else
    ActivateIntelSingle
  fi
fi


