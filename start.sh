#!/usr/bin/env bash
set -e

php artisan optimize:clear

php-fpm -D
nginx -g "daemon off;"
