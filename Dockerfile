# Use a lightweight Java runtime
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Install curl for downloading the JAR
RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

# Download the Suwayomi Server JAR
RUN curl -L -f -o app.jar \
    https://github.com/Suwayomi/Suwayomi-Server/releases/download/v2.1.1867/Suwayomi-Server-v2.1.1867.jar

# Expose the port (Railway will automatically detect this)
EXPOSE 4567

# Create a directory for Suwayomi data
RUN mkdir -p /app/data

# Set environment variables for Suwayomi configuration
ENV SUWAYOMI_SERVER_HOST=0.0.0.0
ENV SUWAYOMI_SERVER_PORT=4567
ENV SUWAYOMI_DATA_DIR=/app/data

# Run the server with proper configuration
CMD java -Xmx512m -Xms128m \
    -Dsuwayomi.server.ip=0.0.0.0 \
    -Dsuwayomi.server.port=${PORT:-4567} \
    -jar app.jar