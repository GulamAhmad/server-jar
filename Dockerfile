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

# Create data directory for Suwayomi
RUN mkdir -p /app/data

# Expose the port
EXPOSE 4567

# Set environment variables
ENV SUWAYOMI_DATA_DIR=/app/data

# Run the server with correct Suwayomi configuration
CMD sh -c "java -Xmx512m -Xms128m \
    -Dsuwayomi.tachidesk.config.server.ip=0.0.0.0 \
    -Dsuwayomi.tachidesk.config.server.port=\${PORT:-4567} \
    -jar app.jar"