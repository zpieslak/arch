#!/bin/bash

# Settings
VM_NAME='Arch_Linux_64'
VM_DVD='archlinux-2022.02.01-x86_64.iso'
VM_TYPE='ArchLinux_64'
VM_DIR=~/VirtualBox\ VMs/$VM_NAME

# Create hard disk
VBoxManage createmedium disk --filename "$VM_DIR/$VM_NAME.vdi" --size 10240

# Create VM
VBoxManage createvm --name "$VM_NAME" --ostype "$VM_TYPE" --register

# Attach disk storage
VBoxManage storagectl "$VM_NAME" --name "SATA" --add sata --controller IntelAHCI
VBoxManage storageattach "$VM_NAME" --storagectl "SATA" --port 0 --device 0 --type hdd --medium "$VM_DIR/$VM_NAME.vdi"

# Add DVD
VBoxManage storagectl "$VM_NAME" --name "IDE" --add ide
VBoxManage storageattach "$VM_NAME" --storagectl "IDE" --port 0 --device 0 --type dvddrive --medium "$VM_DIR/$VM_DVD"

# Add settings
VBoxManage modifyvm "$VM_NAME" --firmware efi
VBoxManage modifyvm "$VM_NAME" --memory 4096 --vram 128
VBoxManage modifyvm "$VM_NAME" --nic1 nat
vboxmanage modifyvm "$VM_NAME" --hostonlyadapter2 vboxnet0
VBoxManage modifyvm "$VM_NAME" --nic2 hostonly
VBoxManage modifyvm "$VM_NAME" --clipboard-mode bidirectional
VBoxManage modifyvm "$VM_NAME" --graphicscontroller vmsvga
VBoxManage modifyvm "$VM_NAME" --audioin on
VBoxManage modifyvm "$VM_NAME" --audioout on
VBoxManage modifyvm "$VM_NAME" --boot1 dvd --boot2 disk --boot3 none --boot4 none
