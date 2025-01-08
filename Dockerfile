# Dockerfile

# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file and install dependencies
COPY pom.xml /app/

# Download dependencies (This step caches dependencies if not changed)
RUN mvn dependency:go-offline

# Copy the source code into the container
COPY src /app/src

# Package the Java application into a JAR
RUN mvn clean package

# Run the application
CMD ["java", "-jar", "target/my-java-app-1.0-SNAPSHOT.jar"]
