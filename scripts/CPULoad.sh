#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
top -bn1 | awk '{ORS=", "};/Cpu/ { print $2}'