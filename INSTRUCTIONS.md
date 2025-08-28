### Run via docker-compose:
1. Run the command to create a jar package of application.
   `mvn clean package -Dspring.liquibase.enabled=false -DskipTests=true`
2. Run the command in root directory of project to build the image:
   `docker-compose up -d --build`

### Run as Spring boot application in Intellij:
1. Run the command to create a postgres container.
   `docker run --name some-postgres -e POSTGRES_PASSWORD=postgres -d -p 5434:5432 postgres:13.22-alpine3.22`
2. Run this file [DemoApplication](src/main/java/com/example/demo/DemoApplication.java)