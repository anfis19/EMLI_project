from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='ledcontrol',
            namespace='sensors1',
            executable='node',
            name='node'
        )
    ])