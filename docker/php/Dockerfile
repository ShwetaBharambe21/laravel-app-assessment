FROM composer:2 AS builder

WORKDIR /app

COPY . .

RUN composer install \
    --no-dev \
    --optimize-autoloader

FROM php:8.4-fpm

RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    curl \
    libzip-dev \
    libpng-dev \
    libonig-dev

RUN docker-php-ext-install \
    pdo_mysql \
    zip \
    mbstring

WORKDIR /var/www/html

COPY --from=builder /app .

RUN chown -R www-data:www-data \
    storage bootstrap/cache

CMD ["php-fpm"]