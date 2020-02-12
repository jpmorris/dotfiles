#!/usr/bin/bash

# (Re)set applications on i3

# DEFINE workspaces

# if external monitor detected


function HDMIConnected {
    xrandr | grep "^HDMI-0" | grep connected
}



# put apps in proper workspaces
i3-msg '[class="Google-chrome"] move workspace 1'
i3-msg '[instance="crx_nckgahadagoaajjgafhacjanaoiihapd"] move workspace 2'
#i3-msg '[class="Veracrypt"] move workspace 3'


# put workspaces on proper display
if HDMIConnected
then
  i3-msg "workspace 1; move workspace to output eDP-1-1"
  i3-msg "workspace 2; move workspace to output eDP-1-1"
  i3-msg "workspace 3; move workspace to output eDP-1-1"
  i3-msg "workspace 4; move workspace to output eDP-1-1"
  i3-msg "workspace 5; move workspace to output eDP-1-1"
  i3-msg "workspace 6; move workspace to output eDP-1-1"
  i3-msg "workspace 7; move workspace to output eDP-1-1"
  i3-msg "workspace 8; move workspace to output HDMI-0"
  i3-msg "workspace 11; move workspace to output HDMI-0"
  i3-msg "workspace 12; move workspace to output HDMI-0"
  i3-msg "workspace 13; move workspace to output HDMI-0"

fi

