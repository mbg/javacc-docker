FROM openjdk:17-alpine
ARG JAVACC_VERSION=7.0.10
ENV JAVACC_VERSION ${JAVACC_VERSION}
LABEL maintainer="github@michael-gale.co.uk"
RUN wget -q -P . -O javacc.jar https://repo1.maven.org/maven2/net/java/dev/javacc/javacc/${JAVACC_VERSION}/javacc-${JAVACC_VERSION}.jar
ENTRYPOINT ["java", "-cp", "/javacc.jar", "javacc"]
