#!/bin/bash

function main() {
  local ssid=$(wpa_cli status | awk -F'=' '/^ssid=/ { print $2 }')

  if [ -z $ssid ]; then
    local link='0'
  else
    local link=$(cat /proc/net/wireless | awk 'END { print $3 }' | sed 's/\.$//')
  fi

  printf "%s" "${ssid} ${link}"
}

main
