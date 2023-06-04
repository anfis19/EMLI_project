#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
#sudo chmod o+rw /dev/ttyACM0
red=$(./echoRosTopic.sh /ttyACM0/red)
if [ $red -eq 0 ]; then
    echo 'p' > /dev/ttyACM0
else
    echo "Alarm"
fi
