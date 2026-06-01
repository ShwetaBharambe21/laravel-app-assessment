#!/bin/bash

set -e

echo "Pulling latest image..."

docker pull shweta779/laravel-app:latest

docker stop laravel-app || true
docker rm laravel-app || true

docker run -d \
  --name laravel-app \
  -p 9000:9000 \
  shweta779/laravel-app:latest

echo "Deployment Successful"