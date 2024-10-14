if [[ -z "$TMUX" ]]; then
  # Re-enable DISPLAY
  tmux send-keys "export DISPLAY=$DISPLAY; clear" ENTER

  # Attach to tmux session
  exec tmux attach
fi
