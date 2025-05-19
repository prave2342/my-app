FROM openjdk:11-jre-slim
WORKDIR /app
COPY target/my-java-app-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]