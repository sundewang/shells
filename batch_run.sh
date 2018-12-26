#!/usr/bin/env bash
# 批量运行

# check parameters
if [ $# -ne 1 ]
then
    echo Please input directory
    exit 1
fi

dir=$1
for d in $dir/*
do
    if [ -d $d ]
    then
        echo start $d/run.sh
        bash $d/run.sh
    else
        echo $d is not directory
    fi
    
done

echo all $dir start