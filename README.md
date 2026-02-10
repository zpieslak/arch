# Arch Linux

The code represents my custom Arch Linux setup. It is written in Ansible and allows to fully automate the setup of a new machine.
It consists all customizations that are needed to be done from scratch to set up new system (including file configuration changes, disk format, package installation and dotfiles).

More information can be found on [blog post](https://codegyver.com/2022/04/23/arch-linux-setup-in-ansible/).

## Instalation

Install ansible dependencies

    ansible-galaxy collection install -r requirements.yml

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

Install tools on host for arch-chroot

    pacman -Sy arch-install-scripts qemu-user-static-binfmt

Insert SD card.

Run installation

    ansible-playbook site.yml -t disk,boot_arm -l pi

Measure temperature

    cat /sys/devices/virtual/thermal/thermal_zone0/temp

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

### Ctags

Install ripper-tags

    gem install ripper-tags

Generate ctags for Ruby project

    ripper-tags -R --exclude=.git --exclude=log --exclude=tmp . $(bundle list --paths) --extra=q

### SSL

Create self-signed ceritificate

    openssl req -new -newkey rsa:4096 -nodes -keyout home.key -out home.csr
    openssl x509 -req -sha256 -days 3650 -in home.csr -signkey home.key -out home.crt -extfile openssl.ini

Contents of openssl.ini

    subjectKeyIdentifier = hash
    authorityKeyIdentifier = keyid:always,issuer:always
    basicConstraints = CA:TRUE
    keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEnciph
    subjectAltName = DNS:example.com, DNS:*.example.com
    issuerAltName = issuer:copy

Create ssl certificate for client authorization

    openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -subj '/CN=example.com' -keyout home_client.key -out home_client.crt

Create client certificate

    openssl req -new -newkey rsa:4096 -nodes -keyout client.key -out client.csr

Sign in client certificate

    openssl x509 -req -sha256 -days 3650 -in client.csr -CA home_client.crt -CAkey home_client.key -out client.crt

## Upgrade posgresql database

Install postgresql-old-upgrade

    sudo pacman -Sy  postgresql-old-upgrade

Prepare old database

    sudo mv /var/lib/postgres/data /var/lib/postgres/olddata
    sudo mkdir /var/lib/postgres/data /var/lib/postgres/tmp
    sudo chown postgres:postgres /var/lib/postgres/data /var/lib/postgres/tmp

Become postgres user

    sudo -i -u postgres

Perform upgrade from 17 to 18

    cd /var/lib/postgres/tmp
    pg_upgrade -b /opt/pgsql-17/bin -B /usr/bin -d /var/lib/postgres/olddata -D /var/lib/postgres/data
