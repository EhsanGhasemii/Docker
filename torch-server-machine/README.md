# ehsan-machine

## instructions
How to build the image?
```bash
docker build -t ehsan-image .
```
How to run the docker container?
```bash
docker run -d --name ehsan-container ehsan-image
```
How to access the container with a bash shell?
```bash
docker exec -it ehsan-container bash
```
How to use gpu in your docker container? and map dataset on it?
```bash
docker run --gpus all -d --name ehsan-container -v datasets:/app/datasets ehsan-image
```



