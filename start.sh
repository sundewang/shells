#!/bin/bash

# 使用说明：配置jarName即可

jarName=test.jar

# 获取脚本的所在绝对路径
case "`uname`" in
    Linux)
		bin_abs_path=$(readlink -f $(dirname $0))
		;;
	*)
		bin_abs_path=`cd $(dirname $0); pwd`
		;;
esac

base=$bin_abs_path

# 检查程序是否已经运行
PIDS=$(ps ax | grep -i $jarName | grep java | grep -v grep | awk '{print $1}')

if [ -n $PIDS ]; then
    echo "program is running, please run stop.sh first, then start"
    exit 1
fi

# run java，将标准输出写到文件，将标准错误写到标准输出中
java -jar $jarName  1>>$base/logs/nohup.log 2>&1 &

echo "start program successfully"

