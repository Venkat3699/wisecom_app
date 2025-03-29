# Using an official lightweight image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache bash nc fortune cowsay openssl

# Copy the script into the container
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the port
EXPOSE 4499

# Command to run the script
CMD ["/usr/local/bin/wisecow.sh"]