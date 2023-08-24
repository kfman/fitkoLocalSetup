#!/usr/bin/env bash

set -euo pipefail

docker_psql() {
    docker exec -it zustelldienst-db psql --username=postgres --command "$1"
}

docker_psql 'drop database "zustelldienst"'
docker_psql '\i /docker-entrypoint-initdb.d/setup.sql'
echo "OK"
