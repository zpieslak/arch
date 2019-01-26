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

### Enable ssh

Set root password

    passwd

Start ssh

    systemctl start sshd

## Boot

Install requirements

    ansible-galaxy install -r requirements.yml

Run initial run

    ansible-playbook -k site.yml -t disk,setup -l local

Remove offending key from ssh

## Site

Run other tags site.yml

    ansible-playbook -k site.yml -t system -l local

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
