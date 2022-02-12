#!/bin/bash

# Setup
id="003"

# Read values
current=$(cat /sys/class/backlight/*/brightness)
max=$(cat /sys/class/backlight/*/max_brightness)
new=$(expr $current + $max \* "$@" / 100)

# Verify max value
if [[ ${new} -gt ${max} ]]; then
  new=$max
fi

# Change brightness
echo $new > /sys/class/backlight/*/brightness

# Send notification
dunstify -a "backlight" -u normal -r "$id" -h int:value:"$(expr $new \* 100 / $max)" "Backlight: ${new}"
