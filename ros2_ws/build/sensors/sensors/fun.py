import subprocess

result = subprocess.run(['sh', '/home/pi/scripts/readSerial.sh', 'ttyACM0'], stdout=subprocess.PIPE).stdout.decode('utf-8').strip()
result = result.split(',')
print(len(result))