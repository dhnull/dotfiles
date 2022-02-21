#!/bin/bash

brillo=$(cat /sys/class/backlight/intel_backlight/brightness)
brillo=$(expr $brillo - 300)
echo $brillo > /sys/class/backlight/intel_backlight/brightness
