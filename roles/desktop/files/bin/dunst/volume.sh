#!/bin/bash

# Setup
id="001"

# Change volume
amixer sset Master "$@" > /dev/null

# Query volume
value=$(awk -F'[][]' '/dB/ { print $2 }' <(amixer sget Master))
status=$(awk -F'[][]' '/dB/ { print $6 }' <(amixer sget Master))

# Send notification
dunstify -a "volume" -u normal -r "$id" -h int:value:"$value" "Volume: ${value} | ${status}"
