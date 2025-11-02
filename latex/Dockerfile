FROM debian:bookworm-slim

# Install necessory packages) 1.bash
RUN apt-get update && apt-get install -y \
  bash \
  neovim \
  git \
  unzip \
  wget \
  && rm -rf /var/lib/apt/lists/*

# Update package lists and install LaTeX packages 
RUN apt-get update && \ 
  apt-get install --no-install-recommends -y \ 
  texlive-full \ 
  latexmk \ 
  && rm -rf /var/lib/apt/lists/*

# 
RUN apt-get update && apt-get install -y python3-pygments

# download and replace nvim configurations in the docker container
COPY download_configurations.sh /usr/local/bin/download_configurations.sh
RUN chmod +x /usr/local/bin/download_configurations.sh
ENTRYPOINT ["/usr/local/bin/download_configurations.sh"]

CMD ["tail", "-f", "/dev/null"]
