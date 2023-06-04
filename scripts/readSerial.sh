#!/bin/bash
#PORT AS INPUT TO THE SCRIPT
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN

string=`head -n 2 /dev/$1`
sleep 1
# string=`head -n 1 /dev/ttyACM0` 
echo $string
