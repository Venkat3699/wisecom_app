# Use Alpine as the base image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache bash fortune netcat-openbsd

# Set the PATH environment variable
ENV PATH=$PATH:/usr/games

# Copy the Wisecow application script
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the application port
EXPOSE 4499


CMD ["bash", "/usr/local/bin/wisecow.sh"]