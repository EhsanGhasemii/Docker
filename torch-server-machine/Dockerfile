# Use a parent image. I will use torch image as parent
#FROM ubuntu:latest
FROM cnstark/pytorch:2.0.1-py3.10.11-cuda11.8.0-ubuntu22.04

WORKDIR /app

RUN echo "deb http://repo.farbeen.local/repository/jammy jammy main restricted\n deb http://rep

# Install necessory packages) 1.bash
RUN apt-get update && apt-get install -y \
  bash \
  neovim \
  git \
  unzip \
  wget \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/

RUN pip config --user set global.index-url http://repo.farbeen.local/repository/pypi/simple
RUN pip config --user set global.trusted-host repo.farbeen.local

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# download and replace nvim configurations in the docker container
COPY download_configurations.sh /usr/local/bin/download_configurations.sh
RUN chmod +x /usr/local/bin/download_configurations.sh
ENTRYPOINT ["/usr/local/bin/download_configurations.sh"]

# keep the container running
CMD ["tail", "-f", "/dev/null"]

