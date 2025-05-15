# Use matlab parent image
FROM mathworks/matlab:r2021a

WORKDIR /app

# Install necessory packages) 1.bash
RUN sudo apt-get update
RUN sudo apt-get install -y bash neovim git unzip wget 
RUN sudo rm -rf /var/lib/apt/lists/*

# download and replace nvim configurations in the docker container
COPY download_configurations.sh /usr/local/bin/download_configurations.sh
RUN sudo chmod +x /usr/local/bin/download_configurations.sh
ENTRYPOINT ["/usr/local/bin/download_configurations.sh"]

# keep the container running
CMD ["tail", "-f", "/dev/null"]

