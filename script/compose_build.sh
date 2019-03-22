#!/bin/bash

# !!! Please run this file in root project folder
# This file is a shortcut for `docker-compose build`
# USAGE:
# $ script/compose_build.sh [environment]
# EG:
# $ script/compose_build.sh 
# $ script/compose_build.sh dev

environment=$1

case "$environment" in
    dev)
        docker-compose -f docker-compose.builder.yml build
        ;;    

    test)
        docker-compose -f docker-compose.builder.yml build
        ;;
     
    *)
        docker-compose -f docker-compose.yml build
esac