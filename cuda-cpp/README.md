## How to create docker container to show grapical interface in your host machine?
```bash
sudo docker run -d --name cuda-cpp -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix cuda-cpp
```
