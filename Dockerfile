FROM openjdk:21-jdk-slim

WORKDIR /app

# Download a specific release JAR
ADD https://github.com/Suwayomi/Suwayomi-Server/releases/tag/v2.1.1867/Suwayomi-Server-v2.1.1867.jar app.jar

EXPOSE 4567
CMD ["java", "-Xmx256m", "-Xms128m", "-jar", "app.jar"]
