FROM openjdk:8
EXPOSE 8080
ARG JAR_FILE=target/lifecode-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} lifecode.jar
VOLUME store
ENTRYPOINT ["java", "-jar", "/lifecode.jar"]