# Unofficial SDK for Quadruped Control (Unitree GO2)

This repository provides an **unofficial SDK** for conducting experiments on control and navigation with the **Unitree GO2** quadruped robot.

---
## Launch instructions:

To clone the repository **with submodules**, run the following:

```bash
git clone --recurse-submodules https://github.com/your-username/go2_ros2_control_sim.git
git submodule update --init --recursive
```

In the project root directory (`go2_ros2_control_sim`)

```bash
source prelaunch.sh

./main_launch.py
```

After launching, new terminal windows should open for logging, keyboard input control, Mujoco simulation.
The robot should appear in the Mujoco window.

## Requirements

libtorch 


## Repository Structure

This repository contains ROS 2 packages and scripts for controlling and simulating the Unitree Go2 robot.

### `controller/`
Contains two types of controllers:
- **RL Controller**: Based on reinforcement learning.
- **Classic Controller**: Based on Unitree's guide controller.

### `commands/`
Provides an interface for sending commands to the robot via:
- Keyboard
- Joystick
- Predefined movement tasks

### `description/`
Includes configuration files and descriptions of robot control modes.

### `bringup/`
Launch utilities for starting the robot control system.

---

## Scripts

### utils

provide a tool for processing the robot state data 

### `prelaunch.sh`
Sources the necessary environment variables and dependencies.

### `main_launch.sh`
Launches the main ROS nodes and associated launch files to control the robot.  
A Mujoco simulation window should open for visualizing the robot.

---

## Notes

- This is not an official Unitree SDK.
