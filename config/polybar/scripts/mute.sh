#!/usr/bin/bash
mute=$(pamixer -t --get-mute)

$mute

if [ $mute == "true" ]; then
    dunstify "Muted" -u low -r 6969
elif [ $mute == "false" ]; then
    dunstify "Unmuted" -u low -r 6969
fi
