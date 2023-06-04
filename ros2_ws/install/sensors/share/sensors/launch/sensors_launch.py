from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        
        Node( # Node for sensor reading
            package='sensors',
            namespace='sensors1',
            executable='talker',
            name='talker',
            parameters=[
                {'my_str': 'ttyACM0'}] # Name of serial port sensors are connected to
        )

        Node( # Node for LED control
            package'ledcontrol',
            namespace='sensors1',
            executable='node',
            name='node'
        )

# Example of sensors using ttyACM1
        # Node(
        #     package='sensors',
        #     namespace='sensors2',
        #     executable='talker',
        #     name='talker'
        #     args='ttyACM1' # Name of serial port sensors are connected to
        # )
    ])