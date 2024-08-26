# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Set environment variables to prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    openjdk-11-jdk \  # Install Java
    python3 \         # Install Python
    python3-pip && \  # Install pip for Python
    apt-get clean

# Set default command to run when a container is started
CMD ["bash"]

