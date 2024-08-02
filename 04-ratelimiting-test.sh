#!/bin/bash
. ./env.sh
if [ -z "$ADMINAPI" ]; then
    echo "Failed to read env file."
    echo "Aborting..."
    exit 1
fi

for ((i=0;i<6;i++)); do
   curl ${PROXY}${RT_PATH2}/user-agent -s -I |grep 'HTTP/1.1'
   sleep .5
done