#!/bin/bash

# hass
tar --exclude='hass/deps' --exclude='hass/.cache' -zcvf /wd2/backup/hass/$(date -u +"%Y-%m-%dT%H:%M:%SZ").tar.gz -C /var/lib/private/ hass/
