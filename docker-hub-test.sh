#!/bin/bash

# Docker Hub test script
# Usage: ./docker-hub-test.sh <your-dockerhub-username>

if [ -z "$1" ]; then
    echo "Usage: $0 <dockerhub-username>"
    echo "Example: $0 myusername"
    exit 1
fi

USERNAME=$1
IMAGE_NAME="test-app"
TAG="latest"
FULL_IMAGE_NAME="$USERNAME/$IMAGE_NAME:$TAG"

echo "Building Docker image: $FULL_IMAGE_NAME"

# Build the image
docker build -t $FULL_IMAGE_NAME .

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "To test the image locally, run:"
    echo "docker run --rm $FULL_IMAGE_NAME"
    echo ""
    echo "To push to Docker Hub, run:"
    echo "docker login"
    echo "docker push $FULL_IMAGE_NAME"
    echo ""
    echo "To test the pushed image, run:"
    echo "docker run --rm $FULL_IMAGE_NAME"
else
    echo "❌ Build failed!"
    exit 1
fi
