FROM maven:3.9.3-sapmachine-17 as Builder

ARG USERNAME
ARG TOKEN
ENV USER=${USERNAME}:${TOKEN}
# RUN apt-get install -y maven
WORKDIR /app
RUN git config --global http.sslVerify false
RUN git clone https://${USER}@git.fitko.de/fit-connect/zustelldienst.git -b epic/bidirectional-communication


WORKDIR /app/zustelldienst
RUN sed -i "s|url: jdbc:postgresql://localhost:5432/zustelldienst|url: jdbc:postgresql://zustelldienst-db:5432/zustelldienst|g" ./src/main/resources/application-dev.yml
RUN mv ./src/main/resources/application-dev.yml ./src/main/resources/application.yml
RUN mvn clean package -DskipTests=true
# CMD mvn spring-boot:run -D spring-boot.run.profiles=dev

FROM maven:3.9.3-sapmachine-17 as Runner
WORKDIR /app/zustelldienst
RUN mkdir -p /app/zustelldienst/well-known
COPY --from=Builder /app/zustelldienst/target/zustelldienst.jar .
CMD ["java", "-jar", "zustelldienst.jar"]
