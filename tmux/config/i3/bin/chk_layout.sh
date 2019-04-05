#!/bin/bash

sleep 2

# standard case: assume it's only laptop screen
exec ~/.screenlayout/laptop.sh

SPACE=$(grep -i "set \$WS4" ~/.config/i3/config | cut -d ' ' -f3-)

# check if at work with three screens
[[ $(/sbin/ip a | grep -w "10.100.0.127") ]] && \
  exec ~/.screenlayout/work.sh && \
  exec i3-msg 'workspace $SPACE output $PRIMARY; exec terminal; exec terminal -e screenfetch; split v; exec terminal'


exit 0
