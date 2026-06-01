#!/bin/sh

echo "Starting Laravel..."

# Generate APP_KEY only if missing
if ! grep -q "^APP_KEY=base64:" .env; then
    echo "Generating APP_KEY..."
    php artisan key:generate --force
fi

# Create SQLite database if needed
mkdir -p database
touch database/database.sqlite

# Clear caches
php artisan config:clear
php artisan cache:clear

# Start Laravel
exec php artisan serve --host=0.0.0.0 --port=9000