CONFIG_PATH="configs/Replica"

run_()
{
    local dataset=$1

    echo "Running dataset: $dataset"
    python -W ignore run.py $CONFIG_PATH/$dataset
    wait
}

run_replica()
{
    run_ "office0.yaml"
    run_ "office1.yaml"
    run_ "office2.yaml"
    run_ "office3.yaml"
    run_ "office4.yaml"
    run_ "office2.yaml"
    run_ "room0.yaml"
    run_ "room1.yaml"
    run_ "room2.yaml"
}

run_replica