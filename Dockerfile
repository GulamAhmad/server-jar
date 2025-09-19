# Use a lightweight Java runtime
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Install curl to download the JAR
RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

# Download Suwayomi Server JAR (specific version v2.1.1867)
RUN curl -L -f -o app.jar \
    https://github.com/Suwayomi/Suwayomi-Server/releases/download/v2.1.1867/Suwayomi-Server-v2.1.1867.jar


# Railway assigns a dynamic port via the $PORT environment variable
# We will tell Suwayomi to listen on it
EXPOSE 4567

# Run Suwayomi with Railway's port
CMD ["java", "-DdisableWebUI=true", "-DbindAddress=0.0.0.0", "-jar", "app.jar"]
