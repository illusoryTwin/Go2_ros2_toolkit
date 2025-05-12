#!/bin/bash

set -e  # Exit immediately if a command fails

# Open first terminal and run ROS 2 workspace commands
gnome-terminal -- bash -c "
source scripts/prelaunch.sh;
./scripts/bringup_launch.sh;
exec bash
"

# Open second terminal and run the virtual environment and Python script
gnome-terminal -- bash -c "
source venv/bin/activate;
cd external/unitree_mujoco/simulate_python;
python3 ./unitree_mujoco.py;
exec bash
"

# Wait for both processes to finish (it will only wait for the second process, ROS 2 is running in its terminal)
wait

