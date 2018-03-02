#!/bin/sh
cd /workspace/laradock
docker-compose up -d nginx mysql phpmyadmin

docker-compose ps