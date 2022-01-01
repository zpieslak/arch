# Run X on stratup only on /dev/tty1
if [[ "$(tty)" == "/dev/tty1" && ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
