#!/bin/bash

# 使用说明：直接运行即可
# 引入库文件
. ./getJarName.sh

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

# 获取路径中jar文件，如果有超过两个jar文件或者返回empty，退出程序
jarArray=($(getJarName $base))
if [ ${#jarArray[*]} -ne 1 ]; then
    echo "please check file in directory first, then start"
    exit 1;
fi

jarName=${jarArray[0]}
echo "jar file name is $jarName"

exec 1> $base/out.log
exec 2> $base/error.log

# 检查程序是否已经运行
PIDS=$(ps ax | grep -i $jarName | grep java | grep -v grep | awk '{print $1}')
# 当程序不存在，PIDS未初始化，使用-n判断就会出错
if [ ! -z $PIDS ]; then
    echo "program is running, please run stop.sh first, then start"
    exit 1
fi

# 切换到程序目录
cd $base
# run java，将标准输出写到文件，将标准错误写到标准输出中
java -jar $jarName  1>>$base/nohup.log 2>&1 &

echo "start program successfully"

