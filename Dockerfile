FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
RUN apk update
RUN apk add bash
COPY ${JAR_FILE} app.jar
COPY wait-for-it.sh ./wait-for-it.sh
RUN chmod +x ./wait-for-it.sh
ENTRYPOINT ["./wait-for-it.sh", "mysql_container:3306", "--", "java","-jar","/app.jar"]
