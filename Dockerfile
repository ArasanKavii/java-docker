FROM maven:3.8-openjdk-8
RUN mkdir /app
WORKDIR /app
COPY . .
RUN mvn clean install
CMD ["java", "-jar", "target/netty-example-1.0-SNAPSHOT.jar"]
