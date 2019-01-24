#!/bin/bash

# 使用说明：配置jarName即可

jarName=test.jar

# 获取程序运行pid
PIDS=$(ps ax | grep -i $jarName | grep java | grep -v grep | awk '{print $1}')

# 结束进程
if [ -z "$PIDS" ]; then
  echo "No java to stop"
  exit 1
else
  kill -9 $PIDS
  echo "$jarName killed"
fi