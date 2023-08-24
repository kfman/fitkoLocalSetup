FROM maven:3.9.3-sapmachine-17 as Builder
ARG USERNAME
ARG TOKEN
ENV USER=${USERNAME}:${TOKEN}
# RUN apt-get install -y maven
WORKDIR /app
RUN git config --global http.sslVerify false
RUN git clone https://${USER}@git.fitko.de/fit-connect/oauth-server.git

WORKDIR /app/oauth-server
RUN mvn clean install -DskipTests=true

FROM maven:3.9.3-sapmachine-17 as Runner
WORKDIR /app/oauth-server
COPY --from=Builder /app/oauth-server/target/fitconnect-client-credentials-grant-handler-1.0.0.jar .
CMD ["java", "-jar", "fitconnect-client-credentials-grant-handler-1.0.0.jar"]

