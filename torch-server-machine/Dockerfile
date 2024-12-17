# Use a parent image. I will use torch image as parent
#FROM ubuntu:latest
FROM cnstark/pytorch:2.0.1-py3.10.11-cuda11.8.0-ubuntu22.04
#FROM cnstark/pytorch:2.4.1-py3.10.15-ubuntu22.04

WORKDIR /app

RUN echo "deb http://repo.farbeen.local/repository/jammy jammy main restricted\n deb http://repo.farbeen.local/repository/jammy jammy-updates main restricted\n deb http://repo.farbeen.local/repository/jammy jammy universe\n deb http://repo.farbeen.local/repository/jammy jammy-updates universe\n deb http://repo.farbeen.local/repository/jammy jammy multiverse\n deb http://repo.farbeen.local/repository/jammy jammy-updates multiverse\n deb http://repo.farbeen.local/repository/jammy jammy-backports main restricted universe multiverse\n deb http://repo.farbeen.local/repository/jammy jammy-security main restricted\n deb http://repo.farbeen.local/repository/jammy jammy-security universe\n deb http://repo.farbeen.local/repository/jammy jammy-security multiverse" > /etc/apt/sources.list

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

