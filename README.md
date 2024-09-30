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
