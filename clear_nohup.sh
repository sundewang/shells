#!/bin/bash

# clear nohup.out

# check parameters
if [ $# -ne 1 ]
then
    echo Please input directory path
    exit 1
fi

dir=$1
for d in $dir/*
do
    if [ -d $d ]
    then
        cd $d
        if [ -f nohup.out ]; then
            cp /dev/null nohup.out
            echo cleared $d/nohup.out
        fi
    else
        echo $d is not directory
    fi

done

echo all $dir are cleared
