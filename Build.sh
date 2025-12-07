#!/bin/bash

# This script builds all 4 sample files in qiskit-CPP
cd qiskit-cpp/samples
mkdir build
cd build 
cmake  -DQISKIT_ROOT=/path/to/qiskit/ -DCMAKE_EXE_LINKER_FLAGS="-Wl,-rpath=$CONDA_PREFIX/lib" -DQRMI_ROOT=/path/to/qrmi/ ..
make

# if you want to build with qiskit runtime instead run the following:
#cmake  -DQISKIT_ROOT=../../../qiskit/ -DCMAKE_EXE_LINKER_FLAGS="-Wl,-rpath=$CONDA_PREFIX/lib" -DQISKIT_IBM_RUNTIME_C_ROOT=../../../qiskit-ibm-runtime-c/ ..
#make

