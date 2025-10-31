# Build stage
FROM maven:latest AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:latest
WORKDIR /app
COPY --from=build /app/target/*.jar ./calculator-app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "calculator-app.jar"]
