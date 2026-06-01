#!/bin/bash
set -e

docker pull shweta779/laravel-app:latest

docker stop laravel-app || true
docker rm laravel-app || true

docker run -d \
  --name laravel-app \
  -p 9000:9000 \
  shweta779/laravel-app:latest

sleep 10

docker exec laravel-app sh -c "
cd /var/www/html

cp .env.example .env 2>/dev/null || true

mkdir -p database
touch database/database.sqlite

php artisan key:generate --force || true
php artisan migrate --force || true

php artisan config:clear || true
php artisan cache:clear || true
"