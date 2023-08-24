FROM maven:3.9.3-sapmachine-17 as Builder
ARG USERNAME
ARG TOKEN
ENV USER=${USERNAME}:${TOKEN}
# RUN apt-get install -y maven
WORKDIR /app
RUN git config --global http.sslVerify false
RUN git clone https://${USER}@git.fitko.de/fit-connect/self-service-portal.git

WORKDIR /app/self-service-portal
RUN mvn clean install -DskipTests=true

FROM maven:3.9.3-sapmachine-17 as Runner
WORKDIR /app/self-service-portal
COPY --from=Builder /app/self-service-portal/target/self-service-portal.jar .
CMD ["java", "-jar", "self-service-portal.jar"]

