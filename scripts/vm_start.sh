#!/bin/bash

# Settings
VM_NAME="$1"

# Start machine
VBoxManage startvm "$VM_NAME"

# Send enter
# VBoxManage controlvm "$VM_NAME" keyboardputscancode 1c
