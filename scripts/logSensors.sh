#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
#Get subscriber value
curDate=$(date)
#data=$(./readSerial.sh ttyACM0)
plantAlarm=$(./echoRosTopic.sh /ttyACM0/plant_water_alarm)
pumpAlarm=$(./echoRosTopic.sh /ttyACM0/pump_water_alarm)
light=$(./echoRosTopic.sh /ttyACM0/light_sensor)
moisture=$(./echoRosTopic.sh /ttyACM0/moisture_sensor)
data="$plantAlarm,$pumpAlarm,$moisture,$light"
echo -n $curDate >> /var/www/html/sensorLog.txt
echo -n ", ttyACM0, " >> /var/www/html/sensorLog.txt
echo -n $data >> /var/www/html/sensorLog.txt
echo >> /var/www/html/sensorLog.txt

./postThingSpeak.sh $data
