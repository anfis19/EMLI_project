#!/bin/bash
DIR_BIN=`dirname $(readlink -f $0)`
cd $DIR_BIN
curDate=$(date)
filepath="/var/www/html/performanceLog.txt"

file=$(basename "$filepath")

echo -n $curDate >> /var/www/html/performanceLog.txt
echo -n ", " >> /var/www/html/performanceLog.txt
./currentCPUTemp.sh >> /var/www/html/performanceLog.txt
echo -n ", " >> /var/www/html/performanceLog.txt
./CPULoad.sh >> /var/www/html/performanceLog.txt
#echo -n ", " >> $file
./ramAvaiable.sh >> /var/www/html/performanceLog.txt
#echo -n ", " >> $file
./diskspaceAvaiable.sh >> /var/www/html/performanceLog.txt
echo -n ", " >> /var/www/html/performanceLog.txt
./connectedToInternet.sh >> /var/www/html/performanceLog.txt
echo -n ", " >> /var/www/html/performanceLog.txt
./transferedBytes.sh >> /var/www/html/performanceLog.txt
echo -n ", " >> /var/www/html/performanceLog.txt
./arePackagesUpdated.sh >> /var/www/html/performanceLog.txt
echo "" >> /var/www/html/performanceLog.txt