#--------- STAGE 1 --------------------

# Start with Red Hat's UBI 8 image and install Maven and OpenJDK 17
FROM registry.access.redhat.com/ubi8/ubi AS builder

# Install dependencies for Maven and Java
RUN dnf install -y java-17-openjdk java-17-openjdk-devel wget && \
    wget https://archive.apache.org/dist/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz && \
    tar -xzf apache-maven-3.8.3-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-3.8.3 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/bin/mvn && \
    rm -f apache-maven-3.8.3-bin.tar.gz && \
    dnf clean all

# Set environment variables for Maven
ENV MAVEN_HOME=/opt/maven
ENV PATH=$MAVEN_HOME/bin:$PATH

WORKDIR /app

# Copy the application files into the container
COPY . /app

# Build the application, skipping tests
RUN mvn clean install -DskipTests=true

# Expose the application port
EXPOSE 8080

# Set the entrypoint to run the application
CMD ["java", "-jar", "/app/target/bankapp.jar"]


#------------ STAGE 2 ---------------

FROM openjdk:17-slim

WORKDIR /app

COPY --from=builder /app/target/*.jar /app/target/bankapp.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/target/bankapp.jar"]
