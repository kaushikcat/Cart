FROM openjdk:11-jdk-slim
WORKDIR /app
COPY ./target/Cart-0.0.1-SNAPSHOT.war /app/Cart-0.0.1-SNAPSHOT.war
EXPOSE 8080
CMD ["java", "-jar", "Cart-0.0.1-SNAPSHOT.war"]
