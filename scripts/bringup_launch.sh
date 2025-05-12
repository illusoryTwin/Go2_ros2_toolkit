#!/bin/bash

set -e  # Exit immediately if a command fails

# Default controller if not provided
CONTROLLER_TYPE=${1:-unitree_guide}

# Go to ROS workspace
cd go2_ros2_control

# Source ROS 2 workspace
source install/setup.bash

# Launch ROS2 bringup in background
ros2 launch go2_bringup main.launch.py controller_type:=$CONTROLLER_TYPE
# ros2 launch go2_bringup go2_mujoco.launch.py

