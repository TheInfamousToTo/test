# Docker Hub Test Image

A simple Docker image for testing Docker Hub pushes and pulls.

## Files

- `Dockerfile` - Simple Alpine-based container with basic utilities
- `version` - Version file that gets copied into the container
- `docker-hub-test.sh` - Helper script for building and pushing
- `.dockerignore` - Excludes unnecessary files from build context

## Usage

### 1. Build the image locally

```bash
# Replace 'yourusername' with your actual Docker Hub username
./docker-hub-test.sh yourusername
```

### 2. Test the image locally

```bash
docker run --rm yourusername/test-app:latest
```

### 3. Push to Docker Hub

```bash
# Login to Docker Hub (you'll be prompted for credentials)
docker login

# Push the image
docker push yourusername/test-app:latest
```

### 4. Test pulling from Docker Hub

```bash
# Remove local image first
docker rmi yourusername/test-app:latest

# Pull and run from Docker Hub
docker run --rm yourusername/test-app:latest
```

## What the container does

The container runs a simple script that:

- Prints a hello message
- Shows the version from the `version` file
- Confirms the container is running successfully

## Image size

This image is very small (~7MB) because it's based on Alpine Linux, making it perfect for testing purposes.
