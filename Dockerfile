FROM openjdk:8-jre-alpine

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/apps/hello-cloud-api/hello-cloud-api.jar"]

RUN useradd javaapp \
	&& chown -R javaapp:javaapp /usr/apps/hello-cloud-api \
	&& chmod -R 777 /usr/apps/hello-cloud-api 

USER javaapp

# Add the service itself
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/apps/hello-cloud-api/hello-cloud-api.jar