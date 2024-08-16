#!/bin/bash

function main() {
  local host, path, title, user

  path=$(tmux display-message -p "#{pane_current_path}" | sed "s|$HOME|~|")
  user=$(tmux display-message -p "#{user}")
  host=$(tmux display-message -p "#{host}")

  title=$(tmux display-message -p "#{pane_title}")

  # Check if title is in the format of 'user@host:path'
  if [[ "$title" == *"@"* ]]; then
    printf "%s" "${title}"
  else
    printf "%s@%s:%s" "${user}" "${host}" "${path}"
  fi
}

main
