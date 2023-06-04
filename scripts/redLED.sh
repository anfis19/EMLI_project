#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN

if [ "$1" -eq 1 ] || [ "$2" -eq 0 ]; then
    /home/pi/scripts/ledOn.sh red
    echo "1"
else
    /home/pi/scripts/ledOff.sh red
    echo "0"
fi