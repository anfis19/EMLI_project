#!/bin/bash
# source /opt/ros/humble/setup.bash
cd /home/pi/ros2emli_ws
source /home/pi/ros2emli_ws/install/setup.bash
sh /home/pi/scripts/readSerial.sh ttyACM0 >> /home/pi/didIrun.txt
bash -ic "ros2 launch /home/pi/ros2emli_ws/src/sensors/launch/sensors_launch.py"
