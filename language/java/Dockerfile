FROM openjdk:11-jre-slim
VOLUME /tmp
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
ENV TZ=Asia/Shanghai
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 12357
ENTRYPOINT ["java", "-jar", "/app.jar"]
