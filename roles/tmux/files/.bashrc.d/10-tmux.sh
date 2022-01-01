if [[ -z "$TMUX" ]] && [[ -z $(tmux has-session 2>&1) ]]; then
  # Re-enable DISPLAY
  tmux send-keys "export DISPLAY=$DISPLAY; clear" ENTER

  # Attach to tmux session
  exec tmux attach
fi
