#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
t=40

if [ "$t" -gt "$1" ]; then
    /home/pi/scripts/ledOn.sh yellow
    echo "1"
else
    /home/pi/scripts/ledOff.sh yellow
    echo "0"
fi