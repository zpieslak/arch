#!/bin/bash

# hass
tar --exclude='hass/deps' -zcvf /wd2/backup/hass/$(date +"%Y-%m-%d-%H.%M.%S").tar.gz -C /var/lib/private/ hass/
