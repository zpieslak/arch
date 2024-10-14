#!/bin/bash

function main() {
  local current_directory, index, output

  current_directory="$(dirname "${BASH_SOURCE[0]}")"
  index=0

  for file in "$current_directory"/bar.d/*.sh ; do
    output=$(source "$file")

    if [[ -n "${output}" ]]; then
      if [[ $index -eq 0 ]]; then
        printf "%s" "${output} "
      else
        printf "%s" "| ${output} "
      fi
    fi

    ((index++))
  done
}

main
