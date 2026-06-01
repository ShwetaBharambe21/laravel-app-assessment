#!/bin/bash

echo "Rollback script executed"

docker stop laravel-app || true
docker rm laravel-app || true

docker run -d \
  --name laravel-app \
  -p 9000:9000 \
  shweta779/laravel-app:latest