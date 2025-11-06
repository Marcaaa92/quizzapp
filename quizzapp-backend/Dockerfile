from jelastic/maven:3.9.5-openjdk-21 as build
workdir /app
copy src ./src
copy resources ./resources
copy pom.xml .

RUN mvn -f ./pom.xml clean package -Dmaven.test.skip=true -P production-server

from  eclipse-temurin:21-jdk-alpine
copy --from=build /app/target/*.jar app.jar
copy --from=build /app/resources/* /resources/

cmd ["java", "-jar", "app.jar"]