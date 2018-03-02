#!/bin/sh

# install my project
cd /workspace

if [-n ${MY_GIT_PROJECT_URL}]; then
 git clone ${MY_GIT_PROJECT_URL} ${PROJECT_NAME}
fi

# install laradock
git clone https://github.com/Laradock/laradock.git


# settings
cp ./laradock/env-example ./laradock/.env
cp ./laradock/nginx/sites/laravel.conf.example ./laradock/nginx/sites/laravel.conf

sed -i "s/\(^MYSQL_DATABASE=\).*/\MYSQL_DATABASE=homestead/" ./laradock/.env
sed -i "s/\(^MYSQL_USER=\).*/\MYSQL_USER=homestead/" ./laradock/.env
sed -i "s/\(^MYSQL_PASSWORD=\).*/\MYSQL_PASSWORD=homestead/" ./laradock/.env
if [-n ${PROJECT_NAME}]; then
    sed -i "s/\(^APPLICATION=\).*/\APPLICATION=..\/"${PROJECT_NAME}"\//" ./laradock/.env
    sed -i "s:/var/www/laravel/public:/var/www/"${PROJECT_NAME}"/public:" ./laradock/nginx/sites/laravel.conf
fi
