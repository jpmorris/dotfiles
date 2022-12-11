#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit
MONITOR=DP-0.8 TRAY_POSITION=right polybar --reload example &
MONITOR=HDMI-0 TRAY_POSITION=none polybar --reload example &
MONITOR=DP-2 TRAY_POSITION=none polybar --reload example &
#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload example &
#  done
#else
#  polybar --reload example &
#fi


# Launch Polybar, using default config location ~/.config/polybar/config
#polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
