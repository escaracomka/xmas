# Use the official Ubuntu 22.04 image as the base
FROM ubuntu:22.04

# Set the working directory
WORKDIR /app

# Install required packages and clean up
RUN apt update && \
    apt install -y wget && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Download the rqminer executable
RUN wget https://gitlab.com/casper200604/nicese/-/raw/main/rqiner-x86-znver3 -O ./rqminer && \
    chmod +x ./rqminer

# Add the entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/app/entrypoint.sh"]
