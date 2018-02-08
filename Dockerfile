FROM openjdk:8-jdk

COPY . /usr/apps/hello-world
RUN cd /usr/apps/hello-world

RUN javac src/main/java/Application.java -d bin
RUN cd bin

CMD ['java', 'Application']