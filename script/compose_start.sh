#!/bin/bash

# !!! Please run this file in root project folder
# This file is a shortcut for `docker-compose up`
# USAGE:
# $ script/compose_start.sh [environment]
# EG:
# $ script/compose_start.sh 
# $ script/compose_start.sh dev

environment=$1

case "$environment" in
    dev)
        docker-compose -f docker-compose.builder.yml -f docker-compose.dev.yml up
        ;;    

    test)
        docker-compose -f docker-compose.builder.yml -f docker-compose.test.yml up
        ;;
     
    *)
        docker-compose -f docker-compose.yml up
esac