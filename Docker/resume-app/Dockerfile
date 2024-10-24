# Use the Red Hat Universal Base Image (UBI) minimal version
FROM registry.access.redhat.com/ubi8/ubi-minimal

# Set environment variables
ENV PHP_VERSION=8.0 \
    PHP_HOME=/opt/php \
    PATH=$PATH:/opt/php/bin

# Install PHP and dependencies
RUN microdnf install -y php php-cli php-common php-fpm && \
    microdnf clean all

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy your PHP file to the working directory
COPY index.php /var/www/html/

# Expose port 8080 to the outside
EXPOSE 8080

# Command to start PHP's built-in web server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]

