# Use the official lightweight nginx image
FROM nginx:alpine

# Remove the default nginx website content
RUN rm -rf /usr/share/nginx/html/*

# Copy our custom config file to the correct location
COPY nginx.conf /etc/nginx/nginx.conf

# Create the directory where the volume will be mounted
# This ensures the directory exists and permissions are correct
mkdir -p /usr/share/nginx/html/images
VOLUME ["/images"]

# Expose port 80 for the web server
EXPOSE 80