#!/bin/bash

function main() {
  local user=$(whoami)
  local host=$(cat /proc/sys/kernel/hostname)
  local directory=$(tmux display-message -p '#{pane_current_path}')

  printf "%s" "${user}@${host}:${directory/$HOME/\~}"
}

main
