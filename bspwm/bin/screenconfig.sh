#!/bin/bash

# Author: Hannes Doyle (marulkan)

# Primary Screen
PRIMARY='HDMI3'
# Secondary Screen
SECONDARY='HDMI2'
# Laptop Screen
LAPTOP='LVDS1'
# Presentation screen
PRESENT='VGA1'

LID_STATE=$(cat /proc/acpi/button/lid/LID0/state | awk '{print $2}')
#VGA_PLUGGED=$(xrandr | grep $PRESENT | grep ' connect')

if [[ $LID_STATE == "closed" ]]; then
    # Normal work layout (Primary screen is the one on the right hand side).
    xrandr --output $LAPTOP --off --output $PRIMARY --auto --primary --output $SECONDARY --auto --left-of $PRIMARY --output $PRESENT --off
    bspc monitor $PRIMARY -d 1 2 3 4 5
    bspc monitor $SECONDARY -d 6 7 8 9 0
else
    # Laptop screen only mode
    xrandr --output $LAPTOP --auto --output $PRIMARY --off --output $SECONDARY --off --output $PRESENT --off
    bspc monitor $LAPTOP -d 1 2 3 4 5 6 7 8 9 0
fi
