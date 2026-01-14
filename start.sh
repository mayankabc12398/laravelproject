#!/usr/bin/env bash
set -e

# Ensure sqlite exists (only if using sqlite)
mkdir -p /var/www/html/database
touch /var/www/html/database/database.sqlite

# VERY IMPORTANT: clear cached config BEFORE starting services
rm -f /var/www/html/bootstrap/cache/*.php || true

php artisan optimize:clear || true
php artisan config:clear || true
php artisan cache:clear || true

php-fpm -D
nginx -g "daemon off;"
