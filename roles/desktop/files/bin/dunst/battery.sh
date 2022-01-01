#!/bin/bash

# Setup
id="002"
status=$(cat /sys/class/power_supply/BAT0/status)
capacity=$(cat /sys/class/power_supply/BAT0/capacity)

if [[ ${status}=="Discharging" && ${capacity} -le 30 ]]; then
  dunstify -a "battery" -u critical -r "$id" "Low battery." "Only ${capacity}% remaining"
fi
