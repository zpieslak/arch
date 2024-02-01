#!/bin/bash

function command_exists() {
  command -v "$1" >/dev/null 2>&1
}

function main() {
  if command_exists xclip; then
    xclip -in -selection clipboard
  elif command_exists pbcopy; then
    pbcopy
  fi
}

main
