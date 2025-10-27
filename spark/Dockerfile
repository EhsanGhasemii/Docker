FROM apache/spark:4.1.0-preview2-java21-r

# Switch to root to install packages
USER root

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir pyspark && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to spark user
USER spark

# Set Python environment
ENV PYSPARK_PYTHON=python3

CMD ["tail", "-f", "/dev/null"]
