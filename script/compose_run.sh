#!/bin/bash

# !!! Please run this file in root project folder
# This file is a shortcut for `docker-compose run`
# USAGE:
# Change `docker-vue-frontend` to your service name
# $ script/compose_run.sh <your command>
# EG:
# $ script/compose_run.sh yarn add lodash

docker-compose -f docker-compose.builder.yml run --rm docker-vue-frontend "$@"