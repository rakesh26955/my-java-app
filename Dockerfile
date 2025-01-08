# Dockerfile v2 using Alpine

# Use the official OpenJDK 11 image based on Alpine as a parent image
FROM openjdk:11-jdk-alpine

# Install Maven in Alpine
RUN apk update && \
    apk add maven

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file
COPY pom.xml /app/

# Copy the source code into the container
COPY src /app/src

# Package the Java application into a JAR with a simplified name (app.jar)
RUN mvn clean package -DfinalName=app

# Set the entrypoint to run the Java application using app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
