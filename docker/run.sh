XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth

# Generate xauth file for Docker to access X11
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
chmod 777 $XAUTH

# Run Docker container
docker run -d -it --gpus all --privileged --network=host --shm-size=15G \
    --device=/dev \
    -e NVIDIA_DRIVER_CAPABILITIES=all \
    -e DISPLAY=$DISPLAY \
    -e XAUTHORITY=$XAUTH \
    -v $XSOCK:$XSOCK \
    -v $XAUTH:$XAUTH \
    -v ./..:/home/Loopy-SLAM \
    --name loopy_exp1 \
    loopy_slam_image