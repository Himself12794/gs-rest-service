FROM openjdk:8-jdk

COPY . /usr/apps/hello-world

RUN javac /usr/apps/hello-world/src/main/java/Application.java -d /usr/apps/hello-world/

CMD ["java", "Application"]