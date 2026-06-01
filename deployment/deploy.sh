#!/bin/bash

set -e

VERSION=$1

docker pull shweta779/laravel-app:$VERSION

docker stop laravel-app || true
docker rm laravel-app || true

docker run -d \
  --name laravel-app \
  -p 9000:9000 \
  shweta779/laravel-app:$VERSION

curl http://localhost/health

echo "Deployment Successful"