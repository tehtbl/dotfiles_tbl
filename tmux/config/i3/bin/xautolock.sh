#!/bin/bash
#By tarnold

TIME="${1:-3}"
# maybe check if argument is number

xautolock -time $TIME -locker "~/.config/i3/bin/i3lock.sh" -notify 30 -notifier "notify-send -u critical -t 5000 -- 'LOCKING screen in 30 seconds'" & disown
