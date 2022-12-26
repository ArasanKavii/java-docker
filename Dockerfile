FROM amazoncorretto:18
RUN mvn clean install
CMD ["java", "-jar", "target/netty-example-1.0-SNAPSHOT.jar"]
