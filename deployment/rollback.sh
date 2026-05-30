#!/bin/bash

PREVIOUS=$1

docker stop laravel-app

docker rm laravel-app

docker run -d \
--name laravel-app \
-p 9000:9000 \
myrepo/laravel-app:$PREVIOUS

echo "Rollback Complete"