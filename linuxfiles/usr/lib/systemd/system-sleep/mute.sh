#!/bin/sh
case $1/$2 in
  pre/*)
    mixer sset Master mute
    ;;
  post/*)
    amixer sset Master mute
    ;;
esac
