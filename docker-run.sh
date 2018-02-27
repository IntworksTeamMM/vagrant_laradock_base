#!/bin/sh
cd /workspace/laradock
sudo docker-compose up -d nginx mysql phpmyadmin

sudo docker-compose ps