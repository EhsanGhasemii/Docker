## How to create docker container to show grapical interface in your host machine?
```bash
sudo docker run -d --name cuda-cpp -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix cuda-cpp
```
How to allow display on docker container? 
```bash
xhost +
```




## To **fully remove all previously installed CUDA Toolkit versions** (and their related packages like `libcublas`, `nvidia-cuda-toolkit`, etc.), follow these steps carefully. This ensures a clean slate before installing a new version.

---

### ✅ Step 1: Remove CUDA Packages

Run the following to purge everything related to CUDA:

```bash
sudo apt-get --purge remove '*cublas*' '*cufft*' '*curand*' '*cusolver*' '*cusparse*' \
    '*npp*' '*nvjpeg*' '*nsight*' '*nvidia*' '*cuda*' 'libcudnn*'
```

Or you can run more simply:

```bash
sudo apt-get --purge remove 'cuda*' 'libcublas*' 'nvidia-cuda-toolkit' 'libcudnn*'
```

Then autoremove and clean up:

```bash
sudo apt-get autoremove -y
sudo apt-get clean
```

---

### ✅ Step 2: Remove CUDA Repository & Keyrings

If you've installed from `.deb` packages or NVIDIA repos:

```bash
sudo rm /etc/apt/sources.list.d/cuda*
sudo rm /etc/apt/preferences.d/cuda*
sudo rm /usr/share/keyrings/cuda-*-keyring.gpg
sudo rm -rf /var/cuda-repo-*
```

---

### ✅ Step 3: Remove CUDA Files from Disk

These are usually installed in:

```bash
sudo rm -rf /usr/local/cuda*
```

This removes `/usr/local/cuda`, `/usr/local/cuda-12.4`, etc.

---

### ✅ Step 4: Check and Remove Symlinks (Optional)

If you had symlinks (e.g., for `nvcc`) pointing to `/usr/local/cuda/bin/nvcc`:

```bash
which nvcc
# If it's found, remove it:
sudo rm $(which nvcc)
```

---

### ✅ Step 5: Verify Clean Slate

```bash
dpkg -l | grep -i cuda
dpkg -l | grep -i nvidia
dpkg -l | grep -i cudnn
```

These should return nothing or only unrelated packages.

---

### 📝 Summary

| Action                    | Command                                                |
| ------------------------- | ------------------------------------------------------ |
| Remove CUDA packages      | `sudo apt-get --purge remove 'cuda*' 'libcublas*' ...` |
| Remove local repo sources | `sudo rm /etc/apt/sources.list.d/cuda*`                |
| Remove installed files    | `sudo rm -rf /usr/local/cuda*`                         |
| Cleanup                   | `sudo apt-get autoremove -y && sudo apt-get clean`     |

---

