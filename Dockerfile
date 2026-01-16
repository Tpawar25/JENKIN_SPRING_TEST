FROM openjdk:17.0.2-jdk

WORKDIR /app

COPY target/indiaproj-1.0.jar /app/JenkinTest.jar

ENTRYPOINT ["java","-jar","/app/JenkinTest.jar"]


