#!/bin/bash
. ./env.sh
if [ -z "$ADMINAPI" ]; then
    echo "Failed to read env file."
    echo "Aborting..."
    exit 1
fi
set -x

curl -s -X POST ${ADMINAPI}/services/${SVC_NAME}/plugins \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -d '
    {
     "name": "rate-limiting",
     "config": {
       "minute": 5
     }
    }
    '
open ${MANAGER}/default/services/${SVC_NAME}/plugins