#!/bin/bash

# Dependency installation and make


# Qiskit
git clone https://github.com/Qiskit/qiskit.git
cd qiskit
make c

cd ..

#Qiskit Runtime C
git clone https://github.com/Qiskit/qiskit-ibm-runtime-c.git
cd qiskit-ibm-runtime-c
mkdir build
cd build
cmake ..
make

cd ../..

# Qiskit Resource Manager
git clone git@github.com:qiskit-community/qrmi.git
cd qrmi
cargo build --release

cd ..

# Qiskit CPP
git clone https://github.com/Qiskit/qiskit-cpp.git

