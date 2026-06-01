#!/bin/bash

set -e

echo "Stopping old containers..."

docker compose down || true

echo "Pulling latest code..."

git pull origin main

echo "Starting application..."

docker compose up -d --build

echo "Deployment successful"