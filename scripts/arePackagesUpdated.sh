#!/bin/bash
#count=$(apt-get update -s | grep -c "upgraded")
count=$(apt-get update -s | grep -c "upgraded")
if [ $count == 0 ]; then
	echo -n "Yes"
else
	echo -n "No"
fi
