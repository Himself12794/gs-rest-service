FROM openjdk:8-jre-alpine

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/apps/hello-cloud-api/hello-cloud-api.jar"]

# Add the service itself
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/apps/hello-cloud-api/hello-cloud-api.jar