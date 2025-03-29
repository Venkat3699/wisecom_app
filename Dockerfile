# Use Alpine as the base image
FROM alpine:latest

# Enable community repository and install necessary packages
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.21/community" >> /etc/apk/repositories && \
    apk add --no-cache bash fortune cowsay netcat-openbsd coreutils

# Set the PATH environment variable
ENV PATH=$PATH:/usr/games

# Copy the Wisecow application script
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the application port
EXPOSE 4499

# Use the correct path for bash
CMD ["/bin/bash", "/usr/local/bin/wisecow.sh"]