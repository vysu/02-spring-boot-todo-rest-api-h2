# Use a base image with Java, Maven, and set the working directory
#FROM maven:3.8.4-openjdk-17 AS builder
FROM openjdk:17-jdk-alpine
# Your Dockerfile commands here

WORKDIR /app

# Copy the project's pom.xml and other necessary files
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn clean package

# Use a lightweight Java image for the final runtime
FROM adoptopenjdk/openjdk17:alpine-jre

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file built in the previous stage to the current directory in the container
COPY --from=builder /app/target/spring-boot-todo-rest-api-h2-0.0.1-SNAPSHOT.jar ./app.jar

# Expose the port your Spring Boot application runs on (adjust if needed)
EXPOSE 8080

# Command to run the Spring Boot application when the container starts
CMD ["java", "-jar", "app.jar"]
