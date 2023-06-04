from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='ledcontrol',
            namespace='ttyACM0',
            executable='node',
            name='node'
        )

        # Node(
        #     package='ledcontrol',
        #     namespace='ttyACM0',
        #     executable='node',
        #     name='node'
        # )
    ])