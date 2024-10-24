# Base image - Red Hat Universal Base Image with OpenJDK
FROM registry.access.redhat.com/ubi8/openjdk-11

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH=$JAVA_HOME/bin:$PATH

# Set the working directory inside the container
WORKDIR /app

# Copy the jar file into the container
COPY target/helloworld-1.0.0.jar /app/helloworld.jar

# Expose the port the application will run on
EXPOSE 8080

# Command to run the Java application
CMD ["java", "-jar", "/app/helloworld.jar"]
