#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN

./ledOn.sh red
./ledOn.sh green
./ledOn.sh yellow
