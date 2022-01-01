#!/bin/bash

function main() {
  local fgdefault='#[default]'

  if [ "$(cat /sys/class/power_supply/AC/online)" == 1 ] ; then
    local charging='+'
  else
    local charging='-'
  fi

  capacity=$(cat /sys/class/power_supply/BAT0/capacity)

  if [ $capacity -le 30 ] ; then
    local fgcolor='#[fg=brightred]'
  else
    local fgcolor='#[fg=default]'
  fi

  # Display the percentage of charge the battery has.
  printf "%s" "${fgcolor}${charging}${capacity}%${fgdefault}"
}

main
