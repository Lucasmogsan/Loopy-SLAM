CONFIG_PATH="configs/TUM_RGBD"

run_()
{
    local dataset=$1

    echo "Running dataset: $dataset"
    python -W ignore run.py $CONFIG_PATH/$dataset
    wait
}

run_tum()
{
    #run_ "freiburg1_desk.yaml"
    run_ "freiburg1_room.yaml"
    #run_ "freiburg2_xyz.yaml"
    #run_ "freiburg3_office.yaml"
}

run_tum
