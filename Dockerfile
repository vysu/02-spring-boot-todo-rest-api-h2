# Use a base image with Java and Maven installed
#FROM maven:3.8.4-openjdk-17 AS builder

# Set the working directory in the container
#WORKDIR /app

# Copy the project's pom.xml and other necessary files
#COPY pom.xml .
#COPY src ./src

# Build the application using Maven
#UN mvn clean package

# Use a lightweight Java image for the final runtime
#FROM adoptopenjdk/openjdk17:alpine-jre

# Set the working directory in the container
#WORKDIR /app

# Copy the JAR file built in the previous stage to the current directory in the container
#COPY --from=builder /app/target/your-application.jar ./app.jar

# Expose the port your application runs on (adjust if needed)
#EXPOSE 8080

# Command to run the application when the container starts
#CMD ["java", "-jar", "app.jar"]
