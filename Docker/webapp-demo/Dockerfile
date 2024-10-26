# Use a valid Tomcat image with Java 8
FROM tomcat:9.0-jdk8

# Maintainer information (optional)
LABEL maintainer="your-email@example.com"

# Set environment variables (optional)
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"

# Create a directory for the app (optional, Tomcat uses /usr/local/tomcat/webapps by default)
WORKDIR /usr/local/tomcat/webapps/

# Copy the WAR file built by Maven to the Tomcat webapps directory
COPY target/webapp-demo-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/webapp-demo.war

# Expose the default Tomcat HTTP port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]

