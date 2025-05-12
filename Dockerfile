ARG ROS_DISTRO=humble

FROM ros:${ROS_DISTRO}-ros-core

ENV DEBIAN_FRONTEND=noninteractive

# install common dependencies 
RUN apt update && apt install -y \
    git \
    cmake \
    build-essential \
    python3-pip \
    python3-colcon-common-extensions \
    ros-${ROS_DISTRO}-rmw-cyclonedds-cpp

# Install build dependencies
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-ament-cmake \
    ros-${ROS_DISTRO}-eigen3-cmake-module \
    libeigen3-dev \
    liblcm-dev && \
    apt-get autoremove -y -qq && \
    rm -rf /var/lib/apt/lists/*


# Install test dependencies
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-ament-lint-auto \
    ros-${ROS_DISTRO}-ament-lint-common && \
    apt-get autoremove -y -qq && \
    rm -rf /var/lib/apt/lists/*

RUN apt update && apt install -y \
    ros-humble-ros-gz \
    ros-humble-joint-state-publisher-gui && \
    apt-get autoremove -y -qq && \
    rm -rf /var/lib/apt/lists/*


# Set up ROS environment
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

WORKDIR /home/dev/go2_ros2_control_sim 

COPY . . 

RUN python3 -m pip install --upgrade pip 

RUN . /opt/ros/humble/setup.sh
