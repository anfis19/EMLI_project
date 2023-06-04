#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
content=$(wget 10.42.0.222/led/$1/off -q -O -)
