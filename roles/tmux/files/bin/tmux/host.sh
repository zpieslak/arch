#!/bin/bash

function main() {
  local title=$(tmux display-message -p "#{pane_title}")

  printf "%s" "${title}"
}

main
