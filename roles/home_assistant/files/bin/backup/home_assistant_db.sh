#!/bin/bash

# home assistant
pg_dump -U postgres -F c -v -f /media/backup1/core/home_assistant/db_$(date -u +"%Y-%m-%dT%H-%M-%SZ").dump hass
