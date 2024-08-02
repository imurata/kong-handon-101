#!/bin/bash
. ./env.sh
if [ -z "$ADMINAPI" ]; then
    echo "Failed to read env file."
    echo "Aborting..."
    exit 1
fi
if [ ! -f "./mygw-backup.yaml" ]; then
    echo "Cannot find mygw-backup.yaml in current dir."
    echo "Aborting..."
    exit 1
fi

echo "Reset all settings before restore. Please hit any key to continue."
read -n 1 -s
set -x
deck gateway reset
set +x
open $MANAGER

echo "Restore previous settings. Please hit any key to continue."
read -n 1 -s
set -x
deck gateway sync ./mygw-backup.yaml
set +x
open $MANAGER

sleep 3
set -x 
curl ${PROXY}${RT_PATH}/user-agent -H "apikey: ${CONSUMER_KEY}"
set +x