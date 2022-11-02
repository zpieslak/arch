#!/bin/bash

# hass
tar --exclude='hass/deps' --exclude='hass/.cache' --exclude='hass/.cloud' -zcvf /wd2/backup/hass/$(date +"%Y-%m-%d-%H.%M.%S").tar.gz -C /var/lib/private/ hass/

# zigbee2mqtt
tar --exclude='var/lib/zigbee2mqtt/log' --exclude='var/lib/zigbee2mqtt/configuration.yaml' -zcvf /wd2/backup/zigbee2mqtt/$(date +"%Y-%m-%d-%H.%M.%S").tar.gz -C / var/lib/zigbee2mqtt etc/zigbee2mqtt

# mosqitto
tar -zcvf /wd2/backup/mosquitto/$(date +"%Y-%m-%d-%H.%M.%S").tar.gz -C /etc/mosquitto/ conf.d/
