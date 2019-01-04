#!/usr/bin/env bash
# delete all files in the directory

# check parameters
if [ $# -ne 2 ]
then
    echo Please input directory and file name
    exit 1
fi

dir=$1
name=$2

for d in $dir/* ; do
    if [ -d $d ]; then
        for f in $d/* ; do
            if [[ $f = $d/$name ]] ; then
                echo $f
                if [ -d $f ]; then
                    rm -r $f
                else
                    rm -i $f
                fi
            fi
        done

    fi

done
