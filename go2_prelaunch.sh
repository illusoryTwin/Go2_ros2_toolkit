#!/bin/bash
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export Torch_DIR="$HOME/libtorch/libtorch/share/cmake/Torch"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/libtorch/libtorch/lib"

