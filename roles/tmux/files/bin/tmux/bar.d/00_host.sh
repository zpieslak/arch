#!/bin/bash

function main() {
  local path, user

  path=$(tmux display-message -p "#{pane_current_path}" | sed "s|$HOME|~|")
  user=$(tmux display-message -p "#{user}")

  printf "%s" "${user}@${path}"
}

main
