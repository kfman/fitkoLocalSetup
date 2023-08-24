#!/usr/bin/env bash

set -euo pipefail

docker_psql() {
    docker exec -it self-service-portal-db psql --username=postgres --command "$1"
}

docker_psql 'drop database "self-service-portal"'
docker_psql '\i /docker-entrypoint-initdb.d/setup.sql'
echo "OK"
