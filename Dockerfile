FROM openjdk:9-jre

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/hello-cloud/hello-cloud.jar"]

# Add Maven dependencies (not shaded into the artifact; Docker-cached)
#ADD target/lib /usr/share/hello-cloud/lib

# Add the service itself
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/share/hello-cloud/hello-cloud.jar
