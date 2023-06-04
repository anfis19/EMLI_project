import rclpy
import subprocess
from rclpy.node import Node

from std_msgs.msg import String


class LED(Node):

    def __init__(self):
        super().__init__('led')
        self.moistureLevel = "50"
        self.plantAlarm = "0"
        self.pumpAlarm = "0"

        self.subscribePlantAlarm = self.create_subscription(String, 'plant_water_alarm', self.plant_callback, 10)
        self.subscribePumpAlarm = self.create_subscription(String, 'pump_water_alarm', self.pump_callback, 10)
        self.subscribeMoisture = self.create_subscription(String, 'moisture_sensor', self.moisture_callback, 10)
        
        self.greenpublisher = self.create_publisher(String, 'green', 10)
        self.yellowpublisher = self.create_publisher(String, 'yellow', 10)
        self.redpublisher = self.create_publisher(String, 'red', 10)


        timer_period = 0.01  # seconds
        self.timer = self.create_timer(timer_period, self.led_callback)

    def led_callback(self):
        msg = String()
        result = subprocess.run(['sh', '/home/pi/scripts/LED.sh', self.moistureLevel, self.plantAlarm, self.pumpAlarm], stdout=subprocess.PIPE).stdout.decode('utf-8').strip()
        result_arr = result.split(' ') # array of green, yellow, and red values [g, y, r]

        msg.data = result_arr[0]
        self.greenpublisher.publish(msg)

        msg.data = result_arr[1]
        self.yellowpublisher.publish(msg)

        msg.data = result_arr[2]
        self.redpublisher.publish(msg)

    def plant_callback(self, msg):
        self.plantAlarm = msg.data

    def pump_callback(self, msg):
        self.pumpAlarm = msg.data

    def moisture_callback(self, msg):
        self.moistureLevel = msg.data

def main(args=None):
    rclpy.init(args=args)

    led = LED()

    rclpy.spin(led)

    # Destroy the node explicitly
    # (optional - otherwise it will be done automatically
    # when the garbage collector destroys the node object)
    led.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()