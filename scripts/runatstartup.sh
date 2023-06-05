#!/bin/bash
#sudo nmcli con up Hostspot03
nmcli con up Hostspot03
chmod o+rw /dev/ttyACM0
cat /dev/ttyACM0
#sudo chmod o+rw /dev/ttyACM0

#source /opt/ros/humble/setup.bash
#source /home/pi/ros2emli_ws/install/setup.bash
#exec /opt/ros/humble/bin/ros2 launch sensors sensors_launch.py
