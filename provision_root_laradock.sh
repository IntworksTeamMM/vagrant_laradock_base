#!/bin/sh

# size of swapfile
cd /workspace
git clone https://github.com/Laradock/laradock.git laradock

cd laradock
cp env-example .env

sed -i "s/\(^MYSQL_DATABASE=\).*/\MYSQL_DATABASE=homestead/" .env
sed -i "s/\(^MYSQL_USER=\).*/\MYSQL_USER=homestead/" .env
sed -i "s/\(^MYSQL_PASSWORD=\).*/\MYSQL_PASSWORD=homestead/" .env


cp nginx/sites/laravel.conf.example nginx/sites/laravel.conf

