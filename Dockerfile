#FROM eclipse-temurin:17-jdk-alpine
#RUN yum install curl -y
#VOLUME /tmp
#EXPOSE 8080
#ADD target/springboot-aws-deploy-service.jar springboot-aws-deploy-service.jar
#ENTRYPOINT ["java","-jar","/springboot-aws-deploy-service.jar"]

# Use Amazon Linux base image
FROM amazonlinux:2

# Install Java
RUN amazon-linux-extras install java-openjdk11 -y

# Install curl
RUN yum install curl -y

# Create a directory for your application
WORKDIR /app

# Expose port 8080
EXPOSE 8080

# Copy the JAR file into the container
COPY target/springboot-aws-deploy-service.jar springboot-aws-deploy-service.jar

# Define the entrypoint command
ENTRYPOINT ["java", "-jar", "springboot-aws-deploy-service.jar"]
