#!/bin/bash

set -e
set -o pipefail
set -u

# We want to capture the id from this line:
# ⎜   ↳ TPPS/2 IBM TrackPoint     id=12   [slave  pointer  (2)]

DEVICE_ID=$(xinput list | grep 'TouchPad' | sed -n 's/^.*id=\([0-9]*\).*$/\1/p')
echo "TouchPad device id is $DEVICE_ID"
# show the user the current status of the device
xinput --list-props $DEVICE_ID | grep 'Device Enabled'
echo "disabling..."
xinput --disable $DEVICE_ID
# show the user the changed status of the device
xinput --list-props $DEVICE_ID | grep 'Device Enabled'

# Apparently this also works:
# $ synclient TouchpadOff=1
# See also the docs for synclient (synaptics touchpad client)
# https://www.x.org/archive/X11R7.5/doc/man/man4/synaptics.4.html
