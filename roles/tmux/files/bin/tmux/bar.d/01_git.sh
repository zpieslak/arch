#!/bin/bash

function include_file() {
  if [[ -f "${1}" ]]; then
    source "${1}"
  fi
}

function trim() {
  local input_string="${1}"
  local max_length=${2}

  if [[ ${#input_string} -gt max_length ]]; then
    echo "${input_string:0:max_length}.."
  else
    echo "${input_string}"
  fi
}

function main() {
  local git_status

  include_file "/opt/homebrew/etc/bash_completion.d/git-prompt.sh"
  include_file "/usr/share/git/completion/git-prompt.sh"

  cd "$(tmux display-message -p '#{pane_current_path}')" || exit

  git_status=$(__git_ps1 "%s")
  git_status=$(trim "${git_status}" 20)

  printf "%s" "${git_status}"
}

main
