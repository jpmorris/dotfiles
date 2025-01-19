#!/usr/bin/env bash

FOUND_BEBOP=$(ping -c 1 192.168.1.25)
if [ "$FOUND_BEBOP"=="0" ]; then
    echo 'updating packages'
    # need visudo to have yay, pacman, makepkg as NOPASSWD
    yay -Su --answerdiff None --answerclean None --noconfirm
    #rtcwake - only if update prevents sleep on lid close
fi
