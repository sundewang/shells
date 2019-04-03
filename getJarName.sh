#!/usr/bin/env bash
# get files which end with jar

function getJarName() {
# params size should be 1
if [ $# -eq 0 ] || [ $# -gt 1 ]; then
    echo
fi

# param should be directory
if ! [ -d $1 ]; then
    echo
fi

echo $(ls $1|grep '.*jar$')
}