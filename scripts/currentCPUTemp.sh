#!/bin/bash
#sensors | awk '/temp1/{print $2}'
temp=$(cat /sys/class/thermal/thermal_zone0/temp)
echo -n $(($temp/1000))
