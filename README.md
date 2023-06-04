# EMLI_project
## Made by Anton Fischer-Nielsen, Christoffer Juhl Kønig and Marcus Bøgelund Rasmussen
Git repository for the Embedded Linux project at SDU, spring 2023

## Structure of repository
The repository contains files needed to setup a rasperry pi running Ubuntu 22.04 to perform as described in our report.
The following folders are present in the repository:
* html
  * Contains files for the Apache2 webserver as well as log files generated during the system running.
  * Should be placed in the /var directory
* ros2_ws
  * Workspace containing the sensors and ledcontrol ros package. To use the packages colcon build has to be run in the ros2_ws and then source the install/setup.bash 
  * Should be placed in the /home/pi directory
* scripts
  * All the scripts used to control the system, are written to just be kept in this folder. 
  * Should be placed in the /home/pi directory

