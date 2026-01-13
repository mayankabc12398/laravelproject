#!/usr/bin/env bash
set -e

# Create sqlite file if using sqlite
mkdir -p /var/www/html/database
touch /var/www/html/database/database.sqlite

php artisan optimize:clear

php-fpm -D
nginx -g "daemon off;"
