#!/bin/bash

# Check if an argument is passed
if [ -z "$1" ]; then
    # No argument passed, run with --dry-run
    rsync -avP --dry-run --delete --exclude=/lost+found /media/backup1/ /media/backup2/
else
    # Argument passed, run without --dry-run
    rsync -avP --delete --exclude=/lost+found /media/backup1/ /media/backup2/
fi

