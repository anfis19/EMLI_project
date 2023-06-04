#!/bin/bash
file=/home/pi/scripts/thingSpeakNotPosted.txt
sleeptime=15

echo "Posting data from without internet"
while read line; do
    IFS=',' read -r -a array <<< ${line}
    if [ "${array[0]}" = "" ]; then 
        #echo "breaking"
        :
    else
        #echo "${array[0]}"
    
    curl -X POST https://api.thingspeak.com/update \
	-d "api_key=KJ04PZPZQMGIA4RO&field1=${array[0]}"
    #echo "${array[1]}"
    sleep $sleeptime
    curl -X POST https://api.thingspeak.com/update \
	-d "api_key=KJ04PZPZQMGIA4RO&field2=${array[1]}"
    #echo "${array[2]}"
    sleep $sleeptime
    curl -X POST https://api.thingspeak.com/update \
	-d "api_key=KJ04PZPZQMGIA4RO&field3=${array[2]}"
    #echo "${array[3]}"
    sleep $sleeptime
    curl -X POST https://api.thingspeak.com/update \
	-d "api_key=KJ04PZPZQMGIA4RO&field4=${array[3]}"
    sleep $sleeptime
    fi
done < $file
echo > $file
