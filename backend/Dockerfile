FROM openjdk:14-jdk-alpine
# COPY ./cadastro/target/*.jar app.jar
#Copy the compiled file
COPY ./srcbuild/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
