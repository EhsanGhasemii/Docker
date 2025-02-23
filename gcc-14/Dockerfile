# Use a parent image. I will use torch image as parent
#FROM ubuntu:latest
#FROM cnstark/pytorch:2.0.1-py3.10.11-cuda11.8.0-ubuntu22.04
FROM gcc:14.2.0

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
WORKDIR /
RUN apt-get update
RUN apt install -y build-essential autoconf libtool pkg-config
RUN git clone --recurse-submodules -b v1.66.0 --depth 1 --shallow-submodules https://github.com/grpc/grpc
WORKDIR /grpc/cmake/build
RUN cmake -DgRPC_INSTALL=ON \
    -DgRPC_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=$MY_INSTALL_DIR \
    ../..
RUN make -j 8
RUN make install

# download and install opencv
WORKDIR /
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/4.x.zip
RUN unzip opencv.zip
RUN mv opencv-4.x opencv
WORKDIR /opencv
RUN cmake -B build
RUN cmake --build build
RUN cmake --install build
RUN ldconfig

# main core to run the proto files
COPY . /app


# keep the container running
CMD ["tail", "-f", "/dev/null"]

