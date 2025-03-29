# Use an official Debian image
FROM debian:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    bash \
    netcat \
    fortune \
    cowsay \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Copy the Wisecow script and certificates into the container
COPY wisecow.sh /usr/local/bin/wisecow.sh
COPY /home/ubuntu/wisecow.crt /usr/local/bin/wisecow.crt
COPY /home/ubuntu/wisecow.key /usr/local/bin/wisecow.key

# Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the port
EXPOSE 4499

# Command to run the script
CMD ["/usr/local/bin/wisecow.sh"]