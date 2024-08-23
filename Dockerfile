# Use an official Maven image to build the application
FROM maven:3.8.5-openjdk-11 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and download the dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and build the application
COPY src ./src
RUN mvn package -DskipTests

# Use an OpenJDK image to run the application
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built .jar file from the Maven container
COPY --from=build /app/target/myapp.jar /app/myapp.jar

# Specify the command to run the application
CMD ["java", "-jar", "myapp.jar"]
