#!/bin/bash
#By tarnold

rofi -show $1 -color-enabled \
-bw "2" \
-padding "5" \
-opacity "75" \
-separator-style solid \
-color-window "#4d4d4d, #a0a0a0, #a0a0a0" \
-color-normal "#4d4d4d, #0096db, #4d4d4d, #a0a0a0, #0096db" \
-color-urgent "#4d4d4d, #cc092f, #4d4d4d, #a0a0a0, #cc092f" \
-color-active "#4d4d4d, #bed600, #4d4d4d, #a0a0a0, #bed600" \
-run-list-command ". ~/.config/i3/bin/print_alias.sh" -run-command "/bin/bash -c '{cmd}'" \
#-run-list-command ". ~/.config/i3/bin/print_alias.sh" -run-command "/bin/zsh -i -c '{cmd}'" -rnow \
#run-list-command "alias | awk -F'[=]' '{print $1}'" -run-command "/bin/zsh -i -c '{cmd}'" -rnow \

