#!/usr/bin/env bash
# 批量结束进程，输入具有同样部分命令名

#check parameter
if [ $# -ne 1 ]
then
    echo Please input command
    exit 1
fi

pkill -9 -f $1
echo killed