#!/bin/bash
. ./env.sh
if [ -z "$ADMINAPI" ]; then
    echo "Failed to read env file."
    echo "Aborting..."
    exit 1
fi

curl -s -X POST ${ADMINAPI}/consumers \
  -d "username=${CONSUMER}"

curl -s -X POST ${ADMINAPI}/consumers/${CONSUMER}/key-auth \
  -d "key=${CONSUMER_KEY}"

sleep .5
set -x
echo
curl ${PROXY}${RT_PATH}/user-agent -H "apikey: ${CONSUMER_KEY}"
echo
curl ${PROXY}${RT_PATH}/user-agent -H "apikey: wrong-key"
