#!/bin/bash

# you need to modify /etc/lightdm/lightdm.conf for the 'startup script' to run this at lightdm start

# GET LAPTOP NAME
if xrandr | grep "^eDP-1-1"
then
  LAPTOPDISPLAYNAME="eDP-1-1"
else
  LAPTOPDISPLAYNAME="eDP-1"
fi

# GET OTHER MONITOR NAMES
if xrandr | grep "^DVI-I-1-1"
then
  LEFTDISPLAYNAME="DVI-I-1-1"
elif xrandr | grep "^DVI-I-2-1"
then
  LEFTDISPLAYNAME="DVI-I-2-1"
fi

# GET OTHER MONITOR NAMES
if xrandr | grep "^DVI-I-2-2"
then
  RIGHTDISPLAYNAME="DVI-I-2-2"
elif xrandr | grep "^DVI-I-3-2"
then
  RIGHTDISPLAYNAME="DVI-I-3-2"
fi

# if either monitors are not detected then just show laptop
if [[ -z "$LEFTDISPLAYNAME" ]] || [[ -z "$RIGHTDISPLAYNAME" ]]
then
  xrandr --output $LAPTOPDISPLAYNAME --primary --mode 2560x1440 --pos 0x0 --rotate normal
else
  LEFTDISPLAYCONNECTED=$(xrandr | grep "$LEFTDISPLAYNAME connected ")
  RIGHTDISPLAYCONNECTED=$(xrandr | grep "$RIGHTDISPLAYNAME connected ")
  # if both monitors are connected then display both
  if [[ -z "$LEFTDISPLAYCONNECTED" ]] && [[ -z "$RIGHTDISPLAYCONNECTED" ]]
  then
    xrandr --output $LAPTOPDISPLAYNAME --mode 2560x1440 --pos 0x0 --rotate normal --output $RIGHTDISPLAYNAME --off --output $LEFTDISPLAYNAME --off
  # else display only laptop
  else
    xrandr --output $LAPTOPDISPLAYNAME --mode 2560x1440 --pos 3840x0 --rotate normal --output $RIGHTDISPLAYNAME --mode 1920x1080 --pos 1920x0 --rotate normal --output $LEFTDISPLAYNAME --primary --mode 1920x1080 --pos 0x0 --rotate normal
  fi
fi


