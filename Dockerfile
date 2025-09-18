FROM openjdk:21-jdk-slim

WORKDIR /app

# Install curl
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Download Suwayomi JAR (specific version)
RUN curl -L -o app.jar https://github.com/Suwayomi/Suwayomi-Server/releases/tag/v2.1.1867/Suwayomi-Server-v2.1.1867.jar

EXPOSE 4567

CMD ["java", "-Xmx256m", "-Xms128m", "-jar", "app.jar"]
