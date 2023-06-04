#!/bin/bash
#source '/opt/ros/humble/setup.bash'
val=$(ros2 topic echo $1 --once)
#echo $val
IFS=''\' read -r -a array <<< $val
echo ${array[1]}