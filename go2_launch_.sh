#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Export required environment variables
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export Torch_DIR="$HOME/libtorch/libtorch/share/cmake/Torch"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/libtorch/libtorch/lib"

cd go2_ros2_control

# Source ROS 2 workspace
source install/setup.bash

# Launch ROS2 bringup in background
ros2 launch go2_bringup go2_mujoco.launch.py &

cd ..

# Activate virtual environment
source venv/bin/activate

# Run Unitree Mujoco script (update path if needed)
python3 unitree_mujoco/unitree_mujoco.py &





