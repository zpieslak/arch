#!/bin/bash

function is_charging() {
  if [[ -d "/sys/class/power_supply" ]] ; then
    [[ "$(cat /sys/class/power_supply/ACAD/online)" == 1 ]]
  else
    pmset -g ps | grep -q 'AC Power'
  fi
}

function get_capacity() {
  if [[ -d "/sys/class/power_supply" ]] ; then
    cat /sys/class/power_supply/BAT0/capacity
  else
    pmset -g batt | grep -o '[0-9]\+%' | tr -d '%'
  fi
}

function main() {
  local capacity, charging, fgcolor

  if is_charging ; then
    local charging='+'
  else
    local charging='-'
  fi

  capacity=$(get_capacity)

  if [ "$capacity" -le 30 ] ; then
    local fgcolor='#[fg=brightred]'
  else
    local fgcolor='#[fg=default]'
  fi

  # Display the percentage of charge the battery has.
  printf "%s" "${fgcolor}${charging}${capacity}%#[default]"
}

main
