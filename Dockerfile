FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git curl zip unzip nginx libpng-dev libonig-dev libxml2-dev libzip-dev \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql mbstring exif pcntl bcmath gd zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
COPY . .

RUN composer install --no-dev --optimize-autoloader

COPY nginx.conf /etc/nginx/sites-available/default

RUN php artisan config:cache && php artisan route:cache && php artisan view:cache

CMD ["bash", "start.sh"]

RUN chmod +x /var/www/html/start.sh