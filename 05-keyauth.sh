#!/bin/bash
. ./env.sh
if [ -z "$ADMINAPI" ]; then
    echo "Failed to read env file."
    echo "Aborting..."
    exit 1
fi

curl -s -X POST ${ADMINAPI}/routes/${RT_NAME}/plugins \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -d '
    {
      "name": "key-auth",
      "config": {
      "key_names": [
        "apikey"
      ]
      }
    }
    '
sleep .5
set -x
echo 
curl ${PROXY}${RT_PATH}/user-agent
echo
curl ${PROXY}${RT_PATH2}/user-agent
