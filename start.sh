#!/usr/bin/env bash
set -e

mkdir -p /var/www/html/database
touch /var/www/html/database/database.sqlite

php artisan optimize:clear || true
php artisan config:clear || true
php artisan cache:clear || true

php-fpm -D
nginx -g "daemon off;"
