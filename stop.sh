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

# 获取路径中jar文件，如果有超过两个jar文件或者返回-1，退出程序
jarArray=($(getJarName $base))
if [ ${#jarArray[*]} -ne 1 ] || [ ${jarArray[0]} -eq -1 ]; then
    echo "please check file in directory first, then start"
    exit 1;
fi

jarName=${jarArray[0]}
echo "jar file name is $jarName"

exec 1> $base/out.log
exec 2> $base/error.log

# 获取程序运行pid
PIDS=$(ps ax | grep -i $jarName | grep java | grep -v grep | awk '{print $1}')

# 结束进程
if [ -z "$PIDS" ]; then
  echo "No java to stop"
  exit 1
else
  echo ${PIDS}
  kill -9 ${PIDS}
  echo "$jarName killed"
fi