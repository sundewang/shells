#!/bin/bash

jarName=test.jar

case "`uname`" in
    Linux)
		bin_abs_path=$(readlink -f $(dirname $0))
		;;
	*)
		bin_abs_path=`cd $(dirname $0); pwd`
		;;
esac
base=$bin_abs_path

if [ -f $base/java.pid ] ; then
	echo "found java.pid, Please run stop.sh first, then start.sh"
    exit 1
fi

# run java
java -jar $jarName  1>>$base/logs/nohup.log 2>&1 &

PIDS=$(ps ax | grep -i $jarName | grep java | grep -v grep | awk '{print $1}')

echo $PIDS > $base/java.pid

