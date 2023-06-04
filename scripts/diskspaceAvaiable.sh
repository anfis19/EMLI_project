#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
percent=$(df --output=pcent / | tr -dc '0-9')
hund=100
var=$(($hund - $percent))
#echo -n "100 - $percent" | bc
echo -n $var