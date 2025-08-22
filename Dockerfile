FROM eclipse-temurin:17.0.15_6-jre
COPY target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]