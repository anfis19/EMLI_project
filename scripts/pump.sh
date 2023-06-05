#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
count=0
var=1
while true; do
    green=$(./echoRosTopic.sh ttyACM0/green)
    yellow=$(./echoRosTopic.sh ttyACM0/yellow)
    if [ $yellow -eq 1 ]; then
        /home/pi/scripts/activateWaterpump.sh 
    fi
    if [ $green -eq 1 ]; then
        if [ $count -ge 12 ]; then
            /home/pi/scripts/activateWaterpump.sh
            count=0
        fi
    fi
    sleep 3600
    count=$(($count + $var))
    echo $count
done
