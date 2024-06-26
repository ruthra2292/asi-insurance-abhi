FROM openjdk:11
#ARG JAR_FILE=target/*.jar
ARG JAR_FILE=artifact/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8081
