FROM docker.mci.dev/python:3.10-slim-buster

WORKDIR /app

COPY requirements.txt ./requirements.txt
COPY main.py ./main.py

RUN pip install -r requirements.txt --index https://repo.mci.dev/artifactory/api/pypi/pypi/simple

ENTRYPOINT ["python3", "main.py"]
