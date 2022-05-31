# Arch linux

## Create Virtual Machine

Copy .iso to ~/VirtualBox VMs/Arch_Linux_64/
Run scripts/vm.sh Arch_Linux_64

## Prepare local host

Local host should respond to ip in hosts file

Prepare vars file for local host

    cp group_vars/test group_vars/local

Generate user password and update group_vars/local

    mkpasswd --method=sha-512

## Initial setup

Prepare and run arch linux live CD on local

### Enable ssh

Find ip on target machine and update hosts

    ip address

Set root password

    passwd

Start ssh

    systemctl start sshd


### Enable wifi

Check if wifi card is not soft-blocked

    rfkill list

Unblock

    rfkill unblock wifi

Check wifi card identifier (i.e. wlan0)

    ip link

Enable wifi card

    ip link set wlan0 up

Generate passphrase for ssid and copy to netclt template and fill host.wifi.ssid, host.wifi.key

    wpa_passphrase SSID PASSWORD

Probe ip from dhcp server

    dhcpcd interface

Test internet connection

    ping google.com

## Boot

Run initial run

    ansible-playbook -k site.yml -t disk,boot -l test

Remove offending key from ssh

## Site

Run other tags site.yml

    ansible-playbook -k site.yml -t system -l test

## Local run

Run connection locally

    ansible-playbook -t mysql site.yml -l local --become

## Notes

### Example ansible configuration file

    https://raw.githubusercontent.com/ansible/ansible/devel/examples/ansible.cfg

### Fix for rmagick and run bundle

    pacman -S libmagick6
    PKG_CONFIG_PATH=/usr/lib/imagemagick6/pkgconfig bundle

### Install aur package with makepkg

    git clone aur_git_repo
    cd aur_git_repo
    makepkg -isc --needed --noconfirm

### Fix internet connection on Arch Virtualbox client

    sudo mkdir -p /etc/systemd/resolved.conf.d
    printf "[Resolve]\nDNSSEC=no\n" | sudo tee /etc/systemd/resolved.conf.d/no-dnssec.conf
    sudo systemctl restart systemd-resolved

## Raspbery PI

Insert SD card.

Run installation

    ansible-playbook site.yml -t arm -l pi

Measure temperature

    cat /sys/devices/virtual/thermal/thermal_zone0/temp

## Aarch64

Change mainline kernel to raspberry pi

    pacman -R --noconfirm linux-aarch64 uboot-raspberrypi
    pacman -S --noconfirm linux-raspberrypi4

## Influx

Delete measurement

    influx delete --bucket "home_assistant" --predicate '_measurement="yourmeasurement"' -o yourorg --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'

## Chrome

Enable native notifications

    chrome://flags/

    Enable system notifications

## Alsa

Test microphone

    arecord -f S16_LE -d 5 -r 16000 /tmp/test-mic.wav

## Docker

Run bash ob docker mysql

Find image id

    sudo docker ps

Run bash

    sudo docker exec -it ID bash

## Mysql

Extract database

    pv database.sql.gz | gunzip | mysql database
