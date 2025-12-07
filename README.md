# Qiskit-C++-HPC-HelloWorld
This purpose of this repo is to provide an approachable tutorial for the use of Qiskit C++ API through a Conda environment for HPC use. It was produced using the FSU HPC cluster and therefore environment specs must be edited for your own cluster but the structure should serve as a starting point for all looking to start the use of compiled programs for their Quantum and/or Hybrid workloads.

## System Dependencies

Before creating the Qiskit environment please make sure that your system has the following: 
- Rust (latest stable recommended)
- C compiler with C++17 support
- CMake and Make (available as RPM packages on RHEL-compatible OS)
- Python ≥ 3.11 (including development header files)

Out of these it is very possible that your HPC resource does not install Rust by default. if that is the case run the following: 
```bash
curl https://sh.rustup.rs -sSf | sh
```

## Environment creation

Given the need for a particular version of Python it is reccomended that you create a virtual environment for which we will utilize Conda. 
```bash
conda create -n quantum_c python=3.12 #Should be a version higher than 3.11, check those available in your HPC system
conda activate quantum_c
```

Then you can load appropriate environment modules that you will need going forward. The most important among these is a compiler with support for C++ 17 for which we will use gnu/13.2.0

```bash
module purge
module load webproxy
module load gnu/13.2.0
```

## Qiskit dependendies
Having completed the environment setup you can now proceed to run the first of our script __Installation.sh__. This script installs and makes the Qiskit, Qiskit-Cpp, Qiskit Runtime and Qiskit resource manager interface repos, following the instructions set forth on the [Qiskit-C++ repo](https://github.com/Qiskit/qiskit-cpp/tree/main?tab=readme-ov-file).





