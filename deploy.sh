#!/bin/bash

set -e

echo "Starting deployment..."

echo "Stopping old container..."
docker stop react-app || true

echo "Removing old container..."
docker rm react-app || true

echo "Logging in to Amazon ECR..."

aws ecr get-login-password --region ap-south-1 | \
docker login --username AWS --password-stdin \
089783390772.dkr.ecr.ap-south-1.amazonaws.com

echo "Pulling latest Docker image..."

docker pull 089783390772.dkr.ecr.ap-south-1.amazonaws.com/react-app:latest

echo "Starting new container..."

docker run -d \
  --name react-app \
  --restart unless-stopped \
  -p 80:80 \
  089783390772.dkr.ecr.ap-south-1.amazonaws.com/react-app:latest

echo "Checking container..."

docker ps

echo "Deployment completed successfully."
