FROM openjdk:9-jdk

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/apps/hello-cloud/hello-cloud.jar"]

# Add Maven dependencies (not shaded into the artifact; Docker-cached)
#ADD target/lib           /usr/apps/myservice/lib

# Add the service itself
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/apps/hello-cloud/hello-cloud.jar