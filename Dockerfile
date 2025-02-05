# First stage: Build the app
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
RUN ls -la /app/target
# Second stage: Create a smaller image for running the app
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=build /app/target/demo-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

