FROM oracle/graalvm-ce:19.1.0 AS build
COPY target/netty-example-1.0-SNAPSHOT.jar /opt/app/
WORKDIR /opt/app/
RUN gu install native-image
RUN native-image --verbose -jar ./netty-example-1.0-SNAPSHOT.jar --static --initialize-at-run-time=io.netty.handler.codec.http.HttpObjectEncoder -H:ReflectionConfigurationResources=netty_reflection_config.json --report-unsupported-elements-at-runtime -O1 -H:Name=netty-native

FROM scratch
COPY --from=build  /opt/app/netty-native /
CMD ["/netty-native"]