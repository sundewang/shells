#!/usr/bin/env bash
#复制文件夹为n份，文件夹命名方式在原有文件夹后面加数字

# check parameters
if [ $# -ne 2 ]
then
    echo Please input directory path and number of directory
else
    srcDir=$1
    total=$2
    
    for (( i = 1; i <= total; i++ ))
    do
        cp -r $srcDir $srcDir$i
    done

    echo copied
fi

