#!/bin/bash

# zigbee2mqtt
tar --exclude={zigbee2mqtt/log,zigbee2mqtt/*.json} -zcvf /media/backup1/core/zigbee2mqtt/$(date -u +"%Y-%m-%dT%H-%M-%SZ").tar.gz -C /var/lib/ zigbee2mqtt/
