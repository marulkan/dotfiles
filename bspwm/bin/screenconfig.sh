#!/bin/bash

# Author: Hannes Doyle (marulkan)

# Primary Screen
PRIMARY='DP-1-2'
# Secondary Screen
SECONDARY='DP-2-1'
# Laptop Screen
LAPTOP='eDP-1'

LID_STATE=$(cat /proc/acpi/button/lid/LID0/state | awk '{print $2}')
#VGA_PLUGGED=$(xrandr | grep $PRESENT | grep ' connect')

if [[ $LID_STATE == "closed" ]]; then
    # Normal work layout (Primary screen is the one on the right hand side).
    xrandr --output $LAPTOP --off --output $PRIMARY --auto --primary --output $SECONDARY --auto --right-of $PRIMARY
    bspc monitor $PRIMARY -d 1 2 3 4 5
    bspc monitor $SECONDARY -d 6 7 8 9 0
else
    # Laptop screen only mode
    xrandr --output $LAPTOP --auto --output $PRIMARY --off --output $SECONDARY --off
    bspc monitor $LAPTOP -d 1 2 3 4 5 6 7 8 9 0
fi
