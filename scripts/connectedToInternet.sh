ping -c 5 www.google.com > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo -n 1
else
	echo -n 0
fi
