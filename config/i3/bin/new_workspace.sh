#!/bin/bash

NEW=$(( $(i3-msg -t get_workspaces | python -m json.tool | grep -i "num" | wc -l) + 1 ))
SPACE=$(grep -i "set \$WS$NEW" ~/.config/i3/config | cut -d ' ' -f3-)

i3-msg workspace $SPACE
