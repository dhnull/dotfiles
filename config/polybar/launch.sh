#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

#polybar -c=~/.config/polybar/config.ini left --reload &
#polybar -c=~/.config/polybar/config.ini center --reload &
#polybar -c=~/.config/polybar/config.ini right --reload &
polybar -c=~/.config/polybar/config.ini main --reload &
