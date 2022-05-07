# Set a variable that can be used in all stages.
ARG BUILD_HOME=/usr/app

# Gradle image for the build stage.
FROM gradle:jdk11 as build-image
ARG BUILD_HOME
ENV APP_HOME=$BUILD_HOME
WORKDIR $APP_HOME

# Copy the Gradle config, source code, and static analysis config into the build container.
COPY --chown=gradle:gradle build.gradle settings.gradle $APP_HOME/
COPY --chown=gradle:gradle src $APP_HOME/src
#COPY --chown=gradle:gradle config $APP_HOME/config
# Build the application.
RUN gradle --no-daemon build

# Java image for the application to run in.
FROM openjdk:11
ARG BUILD_HOME
ENV APP_HOME=$BUILD_HOME
ENV ARTIFACT_NAME=blog-0.0.1-SNAPSHOT.jar
COPY --from=build-image $APP_HOME/build/libs/$ARTIFACT_NAME app.jar

ENTRYPOINT java -jar app.jar
