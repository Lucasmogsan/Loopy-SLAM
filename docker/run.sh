XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
chmod 777 $XAUTH
docker run  -d --gpus all -it --privileged --network=host --shm-size=15G --device=/dev -e NVIDIA_DRIVER_CAPABILITIES=all -e DISPLAY=$DISPLAY -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH -v /home/lucas/Loopy-SLAM:/home/Loopy-SLAM --name loopy_slam_exp1 loopy_slam_image