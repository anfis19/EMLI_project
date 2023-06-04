#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
./ledOff.sh red
./ledOff.sh green
./ledOff.sh yellow