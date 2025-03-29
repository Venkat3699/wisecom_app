FROM debian:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the script into the container
COPY wisecow.sh /app/wisecow.sh

# Ensure the script has execution permissions
RUN chmod +x /app/wisecow.sh

# Expose the service port
EXPOSE 4499

# Run the script
CMD ["/bin/bash", "/app/wisecow.sh"]
