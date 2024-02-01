#!/bin/bash

function main() {
  local status=$(wpa_cli status)
  local ssid=$(echo "$status" | awk -F'=' '/^ssid=/ { print $2 }')
  local wifi_generation=$(echo "$status" | awk -F'=' '/^wifi_generation=/ { print $2 }')

  if [ -z $ssid ]; then
    local link='0'
  else
    local link=$(cat /proc/net/wireless | awk 'END { print $3 }' | sed 's/\.$//')
  fi

  printf "%s" "${ssid} ${wifi_generation} ${link}"
}

main
