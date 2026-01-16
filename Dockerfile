FROM eclipse-temurin:17-jre

WORKDIR /app

COPY target/JenkinTest-1.0.jar /app/JenkinTest.jar

ENTRYPOINT ["java","-jar","/app/JenkinTest.jar"]


