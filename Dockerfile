# Simple test Dockerfile for Docker Hub
FROM alpine:latest

# Add metadata
LABEL maintainer="test-user"
LABEL description="Simple test image for Docker Hub"
LABEL version="1.0.0"

# Install basic utilities
RUN apk add --no-cache curl bash

# Copy version file
COPY version /app/version

# Create a simple script
RUN echo '#!/bin/bash' > /app/hello.sh && \
    echo 'echo "Hello from Docker Hub test image!"' >> /app/hello.sh && \
    echo 'echo "Version: $(cat /app/version)"' >> /app/hello.sh && \
    echo 'echo "Container is running successfully!"' >> /app/hello.sh && \
    chmod +x /app/hello.sh

# Set working directory
WORKDIR /app

# Default command
CMD ["/app/hello.sh"]
