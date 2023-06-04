#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
data=$1
#echo $data
internet=$(./connectedToInternet.sh)
echo $internet
sleeptime=15
if [ $internet -eq 1 ]; then
    #./thingSpeakNotPosted.sh
    IFS=',' read -r -a array <<< ${data}
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
    #sleep $sleeptime
else 
    echo "no internet"
    echo -n $(date) >> /var/www/html/thingSpeakNotPosted.txt
    echo -n ", " >> /var/www/html/thingSpeakNotPosted.txt
    echo -n $data >> /var/www/html/thingSpeakNotPosted.txt
    echo >> /var/www/html/thingSpeakNotPosted.txt
fi

#val=12 #$(python3 read_mcp3008.py)
#echo $val

#curl -X POST https://api.thingspeak.com/update \
#	-d "api_key=KJ04PZPZQMGIA4RO&field2=$val"