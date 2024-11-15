CONFIG_PATH="configs"

run_()
{
    local dataset=$1
    local scene=$2

    echo "Running dataset: $dataset"
    python -W ignore run.py $CONFIG_PATH/$dataset/$scene
    wait
}

run_custom()
{
    run_ "TUM_RGBD" "freiburg3_office.yaml"
    run_ "TUM_RGBD" "freiburg1_desk.yaml"
    run_ "TUM_RGBD" "freiburg1_room.yaml"
    run_ "TUM_RGBD" "freiburg2_xyz.yaml"
    run_ "Replica" "office0.yaml"
    run_ "Replica" "office1.yaml"
    run_ "Replica" "office2.yaml"
    run_ "Replica" "office3.yaml"
    run_ "Replica" "office4.yaml"
    run_ "Replica" "office2.yaml"
    run_ "Replica" "room0.yaml"
    run_ "Replica" "room1.yaml"
    run_ "Replica" "room2.yaml"
    run_ "TUM_RGBD" "freiburg3_office.yaml"
    run_ "TUM_RGBD" "freiburg1_desk.yaml"
    run_ "TUM_RGBD" "freiburg1_room.yaml"
    run_ "TUM_RGBD" "freiburg2_xyz.yaml"
    run_ "TUM_RGBD" "freiburg3_office.yaml"
    run_ "TUM_RGBD" "freiburg1_desk.yaml"
    run_ "TUM_RGBD" "freiburg1_room.yaml"
    run_ "TUM_RGBD" "freiburg2_xyz.yaml"
    run_ "Replica" "office0.yaml"
    run_ "Replica" "office1.yaml"
    run_ "Replica" "office2.yaml"
    run_ "Replica" "office3.yaml"
    run_ "Replica" "office4.yaml"
    run_ "Replica" "office2.yaml"
    run_ "Replica" "room0.yaml"
    run_ "Replica" "room1.yaml"
    run_ "Replica" "room2.yaml"
    run_ "Replica" "office0.yaml"
    run_ "Replica" "office1.yaml"
    run_ "Replica" "office2.yaml"
    run_ "Replica" "office3.yaml"
    run_ "Replica" "office4.yaml"
    run_ "Replica" "office2.yaml"
    run_ "Replica" "room0.yaml"
    run_ "Replica" "room1.yaml"
    run_ "Replica" "room2.yaml"
}

run_custom