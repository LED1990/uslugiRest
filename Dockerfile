FROM alpine/git AS git
WORKDIR /home/aplikacja
RUN git clone https://github.com/LED1990/uslugiRest.git


FROM maven:3.6.0-jdk-8-slim AS build
WORKDIR /home/aplikacja
COPY --from=git /home/aplikacja/uslugiRest/src /home/aplikacja/src
COPY --from=git /home/aplikacja/uslugiRest/pom.xml /home/aplikacja
RUN mvn -f /home/aplikacja/pom.xml clean install

FROM openjdk:8-jre-alpine
WORKDIR /home/aplikacja
COPY --from=build /home/aplikacja/target/UslugiRest-spring-boot.jar /home/aplikacja
EXPOSE 9081
ENTRYPOINT ["java", "-jar", "UslugiRest-spring-boot.jar"]
