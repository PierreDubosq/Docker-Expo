FROM openjdk:23-jdk AS java

FROM node:latest

WORKDIR /app

COPY package-lock.json .
COPY package.json .

RUN npm install

RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O android-sdk.zip && \
    mkdir -p /opt/android-sdk/cmdline-tools && \
    unzip -qq android-sdk.zip -d /opt/android-sdk/cmdline-tools && \
    rm android-sdk.zip

ENV ANDROID_HOME /opt/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/cmdline-tools/tools/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools

COPY --from=java /usr/java/openjdk-23 /usr/java/openjdk-23

ENV JAVA_HOME /usr/java/openjdk-23
ENV PATH $PATH:$JAVA_HOME/bin

RUN yes | $ANDROID_HOME/cmdline-tools/cmdline-tools/bin/sdkmanager --licenses

ENV EXPO_DEVTOOLS_LISTEN_ADDRESS=0.0.0.0

EXPOSE 8081
EXPOSE 19000
EXPOSE 19001
EXPOSE 19002

CMD npm run start --tunnel