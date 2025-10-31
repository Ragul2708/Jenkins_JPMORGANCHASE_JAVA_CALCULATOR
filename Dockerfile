# Use an official Maven image to build the app
FROM maven:3.8.7-jdk-17 AS build

# Set working directory inside the container
WORKDIR /app

# Copy pom.xml and download dependencies first (caching layer)
COPY pom.xml .

RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build the app (package to jar)
RUN mvn clean package -DskipTests

# Use a minimal JRE image to run the app
FROM openjdk:17-jdk-slim

# Copy the jar from the build stage
COPY --from=build /app/target/*.jar /app/calculator-app.jar

# Expose port if needed
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java", "-jar", "/app/calculator-app.jar"]
