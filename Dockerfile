#FROM alpine/git
#WORKDIR /app
#RUN git clone https://github.com/spring-projects/spring-petclinic.git

#todo jak zrobic jedego mavena dla wszystkich kontenerow
FROM maven:3.6.0-jdk-8-slim AS build
WORKDIR /home/aplikacja
COPY src /home/aplikacja/src
COPY pom.xml /home/aplikacja
RUN mvn -f /home/aplikacja/pom.xml clean install

FROM openjdk:8-jre-alpine
WORKDIR /home/aplikacja
COPY --from=build /home/aplikacja/target/UslugiRest-spring-boot.jar /home/aplikacja
EXPOSE 9081
ENTRYPOINT ["java", "-jar", "UslugiRest-spring-boot.jar"]
