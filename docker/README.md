# Running GS_ICP_SLAM with docker and custom dataset

## 1. Clone forked repository
```bash
git clone git@github.com:Lucasmogsan/Loopy-SLAM.git
```

## 2. Build docker image
```bash
cd Loopy-SLAM/docker
docker build -t loopy_slam_image .
```

## 3. Run container
```bash
chmod +x run.sh
./run.sh
```

## 4. Access container
```bash
docker exec -it loopy_exp1 bash
```
- name of container is set in `run.sh`

## 4. Download data
```bash
cd /home/Loopy-SLAM/scripts
chmod +x DATASCRIPT
docker exec -it loopy_exp1 bash
```

## 5. Run loopy-slam
```bash
cd /home/Loopy-SLAM
python run.py configs/TUM_RGBD/freiburg1_desk.yaml
```