#!/bin/bash
. ./env.sh
if [ -z "$ADMINAPI" ]; then
    echo "Failed to read env file."
    echo "Aborting..."
    exit 1
fi
set -x 

SVC_NAME="httpbin-service"
curl -s -X POST ${ADMINAPI}/services \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"${SVC_NAME}\",\"url\":\"$URI\"}" 


curl -s -X POST ${ADMINAPI}/services/${SVC_NAME}/routes \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"${RT_NAME}\",\"paths\":[\"${RT_PATH}\"]}" 


curl -s -X POST ${ADMINAPI}/services/${SVC_NAME}/routes \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"${RT_NAME2}\",\"paths\":[\"${RT_PATH2}\"]}" 

open ${MANAGER}/default/routes/${RT_NAME}
open ${MANAGER}/default/routes/${RT_NAME2}
sleep 3
open ${PROXY}${RT_PATH}
open ${PROXY}${RT_PATH2}