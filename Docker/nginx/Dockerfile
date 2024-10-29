# Use Red Hat UBI 9 minimal image
FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

# Install prerequisites and Nginx
RUN microdnf install -y yum && \
    yum install -y nginx && \
    yum clean all

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

