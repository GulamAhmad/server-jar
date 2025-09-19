# Use a lightweight Java runtime
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Download the latest stable Suwayomi JAR (replace with desired version if needed)
RUN curl -L -o app.jar https://github.com/Suwayomi/Suwayomi-Server/releases/download/v2.1.2/Suwayomi-Server-v2.1.2.jar

# Environment variables
ENV DISABLE_WEBUI=true
ENV BIND_ADDRESS=0.0.0.0
ENV PORT=4567

# Expose the API port
EXPOSE 4567

# Run the server
CMD ["java", "-jar", "app.jar"]
