FROM jenkins/jenkins:lts-jdk17
USER root

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Install any required Python packages
RUN pip3 install --upgrade pip

# Switch back to jenkins user
USER jenkins