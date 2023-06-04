#!/bin/bash
#PORT AS INPUT TO THE SCRIPT
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
stty -F /dev/$1 115200 
# string=`head -n 1 /dev/ttyACM0` 
count=0
while read -r line; do
    if [ "$count" = "0" ]; then
        echo "Received: $line"
        # Do something with the received data
        break
    fi
    count=$(( (count+1) % 2 ))
done < /dev/$1