#!/bin/bash
set -xe
docker stop kong-database
docker stop kong-gateway
docker rm kong-database
docker rm kong-gateway
docker network rm kong-net