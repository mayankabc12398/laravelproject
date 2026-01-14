#!/usr/bin/env bash
set -e

mkdir -p /var/www/html/database
touch /var/www/html/database/database.sqlite

php artisan optimize:clear
php artisan config:clear
php artisan cache:clear

php-fpm -D
nginx -g "daemon off;"
