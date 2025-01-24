#!/usr/bin/env bash

sleep 10
FOUND_BEBOP=$(ping -c 1 192.168.1.25)
if [ "$FOUND_BEBOP"=="0" ]; then
    echo 'waiting for network to come up...'
    sleep 10
    echo 'updating packages'
    # need to run resume systemd script as root, cant get visudo to work
    yay -Su --answerdiff None --answerclean None --noconfirm
    #rtcwake - only if update prevents sleep on lid close
fi
