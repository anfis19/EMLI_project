#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
#IFS=','
#array=( $data)
#pumpAlarm=${array[0]}
#plantAlarm=${array[1]}
#moisture=${array[2]}
#light=${array[3]}
path=/../../var/www/html/sensorLog.txt
#var1
vals=$(awk -F "," '{ print $3 }' $path | awk 'NR!=1 {print}' | tr '\n' ',' | sed 's/,$/\n/')
awk -F "," '{ print $3 }' $path | head -1 | tr '\n' ',' | sed 's/,$/\n/'
echo $vals | ./shellplot.py
#var2
awk -F "," '{ print $4 }' $path | head -1 | tr '\n' ',' | sed 's/,$/\n/'
vals=$(awk -F "," '{ print $4 }' $path | awk 'NR!=1 {print}' | tr '\n' ',' | sed 's/,$/\n/')
echo $vals | ./shellplot.py
#var3
awk -F "," '{ print $5 }' $path | head -1 | tr '\n' ',' | sed 's/,$/\n/'
vals=$(awk -F "," '{ print $5 }' $path | awk 'NR!=1 {print}' | tr '\n' ',' | sed 's/,$/\n/')
echo $vals | ./shellplot.py
#var4
awk -F "," '{ print $6 }' $path | head -1 | tr '\n' ',' | sed 's/,$/\n/'
vals=$(awk -F "," '{ print $6 }' $path | awk 'NR!=1 {print}' | tr '\n' ',' | sed 's/,$/\n/')
echo $vals | ./shellplot.py