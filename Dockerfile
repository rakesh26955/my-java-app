# Use the official OpenJDK 11 Alpine image as the base
FROM openjdk:11-alpine

# Install Maven
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
