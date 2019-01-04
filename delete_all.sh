#!/usr/bin/env bash
# delete all files in the directory

dir=$1
file=$2

for d in $dir/* ; do
    if [ -d $d ]; then
        for f in $d/* ; do
            if [ -f $f ] && [[ $f = $d/$file ]] ; then
                echo $f
                rm $f
            fi
        done

    fi

done
