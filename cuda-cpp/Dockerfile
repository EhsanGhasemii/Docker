# Use a parent image. I will use torch image as parent
#FROM ubuntu:latest
#FROM cnstark/pytorch:2.0.1-py3.10.11-cuda11.8.0-ubuntu22.04
#FROM gcc:14.2.0
FROM gcc:11.4

WORKDIR /app

#RUN echo "deb http://repo.farbeen.local/repository/jammy jammy main restricted\n deb http://repo.farbeen.local/repository/jammy jammy-updates main restricted\n deb http://repo.farbeen.local/repository/jammy jammy universe\n deb http://repo.farbeen.local/repository/jammy jammy-updates universe\n deb http://repo.farbeen.local/repository/jammy jammy multiverse\n deb http://repo.farbeen.local/repository/jammy jammy-updates multiverse\n deb http://repo.farbeen.local/repository/jammy jammy-backports main restricted universe multiverse\n deb http://repo.farbeen.local/repository/jammy jammy-security main restricted\n deb http://repo.farbeen.local/repository/jammy jammy-security universe\n deb http://repo.farbeen.local/repository/jammy jammy-security multiverse" > /etc/apt/sources.list

# Install necessory packages) 1.bash
RUN apt-get update && apt-get install -y \
  bash \
  neovim \
  git \
  unzip \
  wget \
  && rm -rf /var/lib/apt/lists/*

#COPY requirements.txt /app/

#RUN pip config --user set global.index-url http://repo.farbeen.local/repository/pypi/simple
#RUN pip config --user set global.trusted-host repo.farbeen.local

#RUN pip install --upgrade pip
#RUN pip install --no-cache-dir -r requirements.txt

# download and replace nvim configurations in the docker container
COPY download_configurations.sh /usr/local/bin/download_configurations.sh
RUN chmod +x /usr/local/bin/download_configurations.sh
ENTRYPOINT ["/usr/local/bin/download_configurations.sh"]

# download and install cmake
WORKDIR /
RUN wget https://github.com/Kitware/CMake/releases/download/v3.31.0/cmake-3.31.0.tar.gz
RUN tar -xvzf cmake-3.31.0.tar.gz
RUN mv cmake-3.31.0 cmake
WORKDIR /cmake
RUN ./bootstrap && make && make install

# download and install grpc
#WORKDIR /
#RUN apt-get update
#RUN apt install -y build-essential autoconf libtool pkg-config
#RUN git clone --recurse-submodules -b v1.66.0 --depth 1 --shallow-submodules https://github.com/grpc/grpc
#WORKDIR /grpc/cmake/build
#RUN cmake -DgRPC_INSTALL=ON \
#    -DgRPC_BUILD_TESTS=OFF \
#    -DCMAKE_INSTALL_PREFIX=$MY_INSTALL_DIR \
#    ../..
#RUN make -j 8
#RUN make install

# main core to run the proto files
COPY . /app

# download and install cuda-toolkits
WORKDIR /app
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
RUN mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
#RUN wget https://developer.download.nvidia.com/compute/cuda/12.4.0/local_installers/cuda-repo-ubuntu2204-12-4-local_12.4.0-550.54.14-1_amd64.deb
COPY cuda-repo-ubuntu2204-12-4-local_12.4.0-550.54.14-1_amd64.deb /app
RUN cp /var/cuda-repo-ubuntu2204-12-4-local/cuda-*-keyring.gpg /usr/share/keyrings/
RUN dpkg -i cuda-repo-ubuntu2204-12-4-local_12.4.0-550.54.14-1_amd64.deb
RUN apt-get update
RUN apt-get -y install cuda-toolkit-12-4
RUN export PATH=/usr/local/cuda/bin:$PATH
RUN export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
RUN echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
RUN echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc

# install qmake 
RUN apt-get install -y qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools

# install armadillo library
RUN apt-get install -y liblapack-dev
RUN apt-get install -y libblas-dev
RUN apt-get install -y libboost-dev
RUN apt-get install -y libarmadillo-dev

# Install necessary packages for showing display
RUN apt-get update && apt-get install -y \ 
    libxcb-xinerama0 \
    xauth 
ENV QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins

# keep the container running
CMD ["tail", "-f", "/dev/null"]


