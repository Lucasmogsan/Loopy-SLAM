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

## 5. Install PyDBoW3 ??
```bash
cd /home/PyDBoW3
pip install . 
```

## 6. Run the algorithm on data
```bash
cd /home/Loopy_SLAM
python run.py configs/TUM_RGBD/freiburg3_office.yaml
```

## 8. Run gs_icp_slam.py
```bash
cd /home/Loopy_SLAM
python run.py configs/TUM_RGBD/freiburg3_office.yaml
```