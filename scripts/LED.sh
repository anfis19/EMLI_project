#!/bin/bash

DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN

moist=$1
plant=$2
pump=$3

#source 'source /opt/ros/humble/setup.bash'
#ros2 topic echo $4

red=$(/home/pi/scripts/redLED.sh $plant $pump)

yellow=$(/home/pi/scripts/yellowLED.sh $moist)

if [ $red -eq 1 ]; then
    if [ $yellow -eq 1 ]; then
        /home/pi/scripts/ledOff.sh green
        redLED=1
        yellowLED=1
        greenLED=0
    else
        /home/pi/scripts/ledOff.sh green
        redLED=1
        yellowLED=0
        greenLED=0
    fi
else
    if [ $yellow -eq 1 ]; then
        /home/pi/scripts/ledOff.sh green
        redLED=0
        yellowLED=1
        greenLED=0
    else
        /home/pi/scripts/ledOn.sh green
        redLED=0
        yellowLED=0
        greenLED=1
    fi
fi
echo $greenLED $yellowLED $redLED