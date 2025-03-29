FROM debian:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    fortune \
    cowsay \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy script into container
COPY wisecow.sh /app/wisecow.sh

# Ensure script has execution permissions
RUN chmod +x /app/wisecow.sh

# Expose the service port
EXPOSE 4499

# Run the script
CMD ["/bin/bash", "/app/wisecow.sh"]
