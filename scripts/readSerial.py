#!/usr/bin/env python3

import subprocess
import time
import re
import string

while True:
    # cmd_output = subprocess.check_output(['sh','./readSerial.sh', 'ttyACM0'])
    result = subprocess.run(['sh', '/home/pi/scripts/readSerial.sh', 'ttyACM0'], stdout=subprocess.PIPE).stdout.decode('utf-8').strip()
    # cmd_output = string(cmd_output)
    # match = re.search(r"(?<=\').+?(?=\\)",cmd_output)
    # print(match.group())
    print(result[4])
    print(result.split(','))
    time.sleep(1)
# print(cmd_output)