import rclpy
from rclpy.node import Node

from std_msgs.msg import String
#from custom_interfaces.srv import ComponentStatus

import subprocess

class SensorNode(Node):

    def __init__(self):
        super().__init__('sensor_node')
        # self.declare_parameter('my_str', rclpy.Parameter.Type.STRING)
        self.port = 'ttyACM0'#self.get_parameter('my_str')
        
        self.moisturePublisher = self.create_publisher(
            String,
            'moisture_sensor',
            10
        )

        self.lightsensorPublisher = self.create_publisher(
            String,
            'light_sensor',
            10
        )

        self.waterAlarmPumpPublisher = self.create_publisher(
            String,
            'pump_water_alarm',
            10
        )

        self.waterAlarmPlantPublisher = self.create_publisher(
            String,
            'plant_water_alarm',
            10
        )
        
        timer_period = 0.01  # seconds
        self.timer = self.create_timer(timer_period, self.sensor_callback)


    def sensor_callback(self):
        msg = String()
        # serialPort = 'ttyACM0'
        readValue = self.read_sensor(self.port)
        if len(readValue) > 3:
            msg.data = readValue[2]
            self.moisturePublisher.publish(msg)
            
            msg.data = readValue[3]
            self.lightsensorPublisher.publish(msg)

            msg.data = readValue[1]
            self.waterAlarmPumpPublisher.publish(msg)

            msg.data = readValue[0]
            self.waterAlarmPlantPublisher.publish(msg)

        

    def read_sensor(self, serialPort): # Returns an array of sensor values read from given serial port
        result = subprocess.run(['sh', '/home/pi/scripts/readSerial.sh', self.port], stdout=subprocess.PIPE).stdout.decode('utf-8').strip()
        return result.split(',')


def main(args=None):
  rclpy.init(args=args)

  sensor_node = SensorNode()

  rclpy.spin(sensor_node)

  """
  Destroy the node explicitly
  (optional - otherwise it will be done automatically
  when the garbage collector destroys the node object)
  """
  SensorNode.destroy_node()
  rclpy.shutdown()


if __name__ == '__main__':
  main()