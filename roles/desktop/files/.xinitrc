#!/bin/sh

# Import environemnt to systemd user session
systemctl --user import-environment DISPLAY XAUTHORITY

# Run graphical-session.target
systemctl --user start --wait xorg.target
