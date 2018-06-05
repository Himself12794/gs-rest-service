FROM dekstroza/openjdk9-alpine as packager

# First stage: JDK 9 with modules required for Spring Boot
RUN /opt/jdk-9/bin/jlink \
    --module-path /opt/jdk-9/jmods \
    --verbose \
    --add-modules java.base,java.logging,java.xml,jdk.unsupported,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument \
    --compress 2 \
    --no-header-files \
    --output /opt/jdk-9-minimal

# Second stage, add only our custom jdk9 distro and our app
FROM alpine:3.6
COPY --from=packager /opt/jdk-9-minimal /opt/jdk-9-minimal
COPY target/*.jar /opt/

ENV JAVA_HOME=/opt/jdk-9-minimal
ENV PATH="$PATH:$JAVA_HOME/bin"

EXPOSE 8080
CMD java -jar /opt/*.jar