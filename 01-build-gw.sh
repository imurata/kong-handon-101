#!/bin/bash
if [ ! -x "$(which docker 2>/dev/null)" ]; then
    echo "Cannot execute docker command."
    echo "Aborting."
    exit 1
fi
if [ -f "$KONG_LICENSE_FILE" ]; then
    export KONG_LICENSE_DATA=$(cat $KONG_LICENSE_FILE)
fi

set -xe
docker network create kong-net

docker run -d --name kong-database \
  --network=kong-net \
  -p 5432:5432 \
  -e "POSTGRES_USER=kong" \
  -e "POSTGRES_DB=kong" \
  -e "POSTGRES_PASSWORD=kongpass" \
  postgres:13

docker run --rm --network=kong-net \
 -e "KONG_DATABASE=postgres" \
 -e "KONG_PG_HOST=kong-database" \
 -e "KONG_PG_PASSWORD=kongpass" \
 -e "KONG_PASSWORD=test" \
kong/kong-gateway:3.7.1.2 kong migrations bootstrap

docker run -d --name kong-gateway \
 --network=kong-net \
 -e "KONG_DATABASE=postgres" -e "KONG_PG_HOST=kong-database" \
 -e "KONG_PG_USER=kong" -e "KONG_PG_PASSWORD=kongpass" \
 -e "KONG_ADMIN_LISTEN=0.0.0.0:8001" \
 -e "KONG_ADMIN_GUI_URL=http://localhost:8002" \
 -e KONG_LICENSE_DATA \
 -p 8000:8000 \
 -p 8001:8001 \
 -p 8002:8002 \
 kong/kong-gateway:3.7.1.2

open http://localhost:8002/
