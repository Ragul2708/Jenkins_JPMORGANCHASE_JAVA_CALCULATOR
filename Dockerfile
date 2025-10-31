# Use a lightweight OpenJDK image
FROM openjdk:17-jdk-alpine

# Set working directory inside the container
WORKDIR /app

# Copy the built JAR from your target folder into the container
COPY target/calculator-1.0-SNAPSHOT.jar /app/calculator.jar

# Expose the port your app will run on
EXPOSE 8080

# Run the JAR when the container starts
ENTRYPOINT ["java", "-jar", "calculator.jar"]
