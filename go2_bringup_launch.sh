#!/bin/bash

set -e  # Exit immediately if a command fails

# Go to ROS workspace
cd go2_ros2_control

# Source ROS 2 workspace
source install/setup.bash

# Launch ROS2 bringup in background
ros2 launch go2_bringup go2_mujoco.launch.py

