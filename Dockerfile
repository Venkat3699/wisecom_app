# Use an official base image
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the PATH environment variable
ENV PATH=$PATH:/usr/games

# Copy the Wisecow application script
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the port the app runs on
EXPOSE 4499

# Command to run the application
CMD ["bash", "/usr/local/bin/wisecow.sh"]