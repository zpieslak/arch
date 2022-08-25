# Arch Linux

The code represents my custom Arch Linux setup. It is written in Ansible and allows to fully automate the setup of a new machine.
It consists all customizations that are needed to be done from scratch to set up new system (including file configuration changes, disk format, package installation and dotfiles).

More information can be found on [blog post](https://codegyver.com/2022/04/23/arch-linux-setup-in-ansible/).

## Testing

To test the code a virtualbox machine can be created

    # Copy .iso to ~/VirtualBox VMs/Arch_Linux_64/
    scripts/vm.sh Arch_Linux_64

## Prepare ansible server

Run Arch Linux live iso and follow `iwctl` setup to obtain wifi connection.

Check if wifi card is not soft-blocked

    rfkill list
    rfkill unblock wifi

Probe ip from dhcp server

    dhcpcd interface

Test internet connection

    ping google.com

Find local `ansible_server_ip`

    ip address

Set root password

    passwd

Start ssh (if not started)

    systemctl start sshd

## Prepare ansible client

Copy variables configuration file

    cp group_vars/all group_vars/ansible_server

Generate user password and update group_vars/local

    mkpasswd --method=sha-512

Verify ssh connection

    ssh root@ansible_server_ip

Update ./hosts file with `ansible_server_ip`

### Boot

Format disk and install boot files

    ansible-playbook -k site.yml -t disk,boot -l test

### Roles

Run other roles from site.yml

    ansible-playbook -k site.yml -t system -l test

Run connection locally

    ansible-playbook site.yml -t mysql -l local --become

## Notes

### Example ansible configuration file

    https://raw.githubusercontent.com/ansible/ansible/devel/examples/ansible.cfg

### Raspbery PI

Insert SD card.

Run installation

    ansible-playbook site.yml -t arm -l pi

Measure temperature

    cat /sys/devices/virtual/thermal/thermal_zone0/temp

Change mainline kernel to raspberry pi

    pacman -R --noconfirm linux-aarch64 uboot-raspberrypi
    pacman -S --noconfirm linux-raspberrypi4

### Alsa

Test microphone

    arecord -f S16_LE -d 5 -r 16000 /tmp/test-mic.wav

### Docker

Run bash ob docker mysql

Find image id

    sudo docker ps

Run bash

    sudo docker exec -it ID bash

### Mysql

Extract database

    pv database.sql.gz | gunzip | mysql database

### Zigbee2mqtt

Check connected device with cc-tool

    sudo cc-tool -t

Flash firmware with cc-tool

    sudo cc-tool -e -w FILE.hex
