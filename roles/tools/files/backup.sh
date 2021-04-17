#!/bin/bash

# hass
tar --exclude='hass/deps' -zcvf /wd2/backup/hass/$(date +"%Y-%m-%d-%H.%M.%S").tar.gz -C /var/lib/private/ hass/

# zigbee2mqtt
cp /etc/zigbee2mqtt/configuration.yaml /wd2/backup/zigbee2mqtt/
