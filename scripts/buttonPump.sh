#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN

while true; do
    var=$(./getButtonCount.sh)
    echo $var
    if [ $var -eq 1 ]; then
        ./activateWaterpump.sh
    fi
    sleep 2
done
