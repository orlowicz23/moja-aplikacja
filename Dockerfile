
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app
COPY . .

RUN mvn clean package -DskipTests


FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY --from=build /app/target/demoWeb-0.0.1-SNAPSHOT.jar /app/demoWeb.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/demoWeb.jar"]

