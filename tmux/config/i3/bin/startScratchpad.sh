#!/bin/bash
#By tarnold

sleep 5 
i3-msg "exec --no-startup-id keepassx"
sleep 0.3 
i3-msg '[ class="Keepassx" ] move scratchpad'
