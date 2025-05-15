# Docker 

## Usefull commands
build an image and identify it.
```bash 
docker build -t hello-docker . 
```

show images list. 
```bash 
docker images
docker image ls
```

run your image.
```bash
docker run hello-docker 
docker run hello-docker npm start
docker run -it ubuntu # for running in interactive mode.
docker run -it react-app bash
docker run -it react-app sh
docker start -i <31b> # 31b is the container ID
```

show all the containers.
```bash
docker ps
docker ps -a # for showing all process including stoped one. 
```

show history of layers in an image
```bash
docker history <image_name>
```

check error of creating an image. 
```bash
docker logs <image_name>
```

How to build the image?
```bash
docker build -t ehsan-image .
```
How to run the docker container?
```bash
docker run -d --name ehsan-container ehsan-image
```
How to run the docker container with specefic dns? 
```
docker run --dns=8.8.8.8 -d --name ehsan-container ehsan-image
```
How to access the container with a bash shell?
```bash
docker exec -it ehsan-container bash
```
How to use gpu in your docker container? and map dataset on it?
```bash
docker run --gpus all -d --name ehsan-container -v datasets:/app/datasets ehsan-image
```

How to save an image? 
```bash
docker save sad:0.1.1-rpc | gzip > ~/dockers/sad_0.1.1-rpc.tar.gz
docker build . -f Dockerfile -t sad:0.1.0-rpc --no-cache
```
How to load an image? 
```bash
gzip -dc ~/docker/sad_0.1.1-rpc.tar.gz | docker load
```

How to set your main network as wrapper of your conatiner?
```bash
sudo docker run --network host ...
```


## Milad project
1. Create a virtual env by running:
`python3 -m venv venv`
activate your virtual env
`source venv/bin/activate`
2. Install dependencies:
`pip install -r requirements.txt`
3. Test your app locally
4. Create a Dockerfile
5. Create a docker-compose.yaml file
6. Run `docker compose up -d`
7. Stop `docker compose down`
8. List running containers `docker ps`
9. List running and stopped containers `docker ps -a`
10. List images `docker image ls`
11. deactivate your virtual env
`deactivate`




## HH
Sure, I can help with that! Here are the steps to remove Docker containers and images:

### Removing Docker Containers

1. **List all containers** (including stopped ones):
   ```sh
   docker ps -a
   ```

2. **Stop a running container**:
   ```sh
   docker stop <container_id_or_name>
   ```

3. **Remove a specific container**:
   ```sh
   docker rm <container_id_or_name>
   ```

4. **Remove all stopped containers**:
   ```sh
   docker container prune
   ```

### Removing Docker Images

1. **List all images**:
   ```sh
   docker images -a
   ```

2. **Remove a specific image**:
   ```sh
   docker rmi <image_id>
   ```

3. **Remove all unused images**:
   ```sh
   docker image prune
   ```

4. **Remove all images** (use with caution):
   ```sh
   docker rmi $(docker images -q)
   ```

### Clean Up All Unused Resources

To remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes:
```sh
docker system prune -a
```


You can copy files from your local machine to a Docker container using the `docker cp` command. Here’s how you can do it:

1. **Identify the container ID or name**: First, you need to know the ID or name of the Docker container to which you want to copy the files. You can list all running containers with:

    ```sh
    docker ps
    ```

2. **Copy the files**: Use the `docker cp` command to copy files from your host to the container. The syntax is:

    ```sh
    docker cp /path/to/local/file_or_directory container_id:/path/in/container
    ```

    For example, if you want to copy a file named `example.txt` from your local machine to the `/tmp` directory in a container named `mycontainer`, you would use:

    ```sh
    docker cp example.txt mycontainer:/tmp/
    ```

3. **Verify the copy**: You can verify that the file has been copied correctly by executing a command inside the container to check the destination directory:

    ```sh
    docker exec mycontainer ls /tmp/
    ```

This method is straightforward and doesn't require any additional setup⁵⁶⁷.




## docker-compose.yaml
```docker-compose.yaml
version: '3.8'

services:
  app:
    image: cnstark/pytorch:2.0.1-py3.10.11-cuda11.8.0-ubuntu22.04
    container_name: my_app_container
    working_dir: /app
    volumes:
      - .:/app
    command: ["tail", "-f", "/dev/null"]
    build:
      context: .
      dockerfile: Dockerfile
    environment:
      - DEBIAN_FRONTEND=noninteractive
    tty: true
    stdin_open: true
```

Explanation
version: '3.8': Specifies the version of the docker-compose file format.

services: Defines the services that will run.

app: The name of your service.

image: Specifies the base image to use.

container_name: The name of the container.

working_dir: The working directory inside the container.

volumes: Mounts the current directory to /app inside the container.

command: Keeps the container running.

build: Defines the build context and Dockerfile to use.

environment: Sets environment variables.

tty: true and stdin_open: true: Ensures the container remains interactive, useful for debugging.


## How to restart your Docker container? 
Yes, there is a way to automatically restart your Docker containers after your computer is turned back on. You can use the `--restart` policy when running your container. Here are the steps:

1. **Run the Container with Restart Policy**:
   You can specify a restart policy when you start your container using the `docker run` command. For example, to restart the container automatically unless it is explicitly stopped, you can use:
   ```bash
   docker run -d --restart unless-stopped my_container_image
   ```
   This will ensure that the container restarts automatically when your computer is turned back on.

2. **Check Restart Policies**:
   You can also check the restart policies of your running containers using the following command:
   ```bash
   docker inspect --format='{{.HostConfig.RestartPolicy.Name}}' container_name
   ```
   Replace `container_name` with the name of your container.

3. **Update Existing Containers**:
   If you have already running containers and want to update their restart policies, you can stop the container, update the restart policy, and start it again:
   ```bash
   docker stop container_name
   docker update --restart unless-stopped container_name
   docker start container_name
   ```

By setting the restart policy, your Docker containers will automatically start when your computer is turned back on, ensuring they remain up and running.

Does this help with what you were looking for?

## How to make all the containers down? 
```bash
docker rm -f $(docker ps -aq)
```


## How to add your user to the docker group? 
1. Create the Docker group(if it doesn't already exist):
  ```bash
     sudo groupadd docker
  ```
2. Add your user to the Docker group: 
  ```bash
     sudo usermod -aG docker $USER
  ```









