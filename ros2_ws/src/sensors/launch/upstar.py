import robot_upstart

j = robot_upstart.Job(name="sensorsAtBoot")
j.symlink = True

j.add(package="sensors", filename="launch/sensors_launch.py")

j.install()