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
module load webproxy # This allows connection to the internet, check the process for your HPC resource
module load gnu/13.2.0
```

## Qiskit dependendies
Having completed the environment setup you can now proceed to run the __Installation.sh__. This script installs and makes the Qiskit, Qiskit-Cpp, Qiskit Runtime and Qiskit resource manager interface repos, following the instructions set forth on the [Qiskit-C++ repo](https://github.com/Qiskit/qiskit-cpp/tree/main?tab=readme-ov-file).

To run it please do the following: 
```bash
chmod +x Installation.sh
./Installation.sh
```


## Building your code
Inside the Qiskit-CPP folder you will now find a folder called samples which should have 4 code samples allowing you try out different functionalities in Qiskit including 2 which allow submissions to the IBM Quantum Cloud. To use them we will now instantiate our environment variables and build them.

### Step 1 - IBM credentials
Upload your account credentials to $HOME/.qiskit/qiskit-ibm.json (see https://github.com/Qiskit/qiskit-ibm-runtime?tab=readme-ov-file#save-your-account-on-disk) or set the following environment variables.

```bash
QISKIT_IBM_TOKEN=<your API key>
QISKIT_IBM_INSTANCE=<your CRN>
```

### Step 2- Build C++ files
Now you can go ahead and edit the __Build.sh__. This file links to the appropriate conda environment file and make all 4 sample files available for execution. To run your own code feel free to edit the 4 files provided or add more files. 

To run it please do the following: 
```bash
chmod +x Build.sh
./Installation.sh
```

__NOTE:__ The paths for the cmake inside the Build.sh are relative but they can be written in absolute paths if any errors arise

## Submitting your jobs

Having completed all of the above now we will run our codes, which we could do simply by the following line: 

```bash
./circuit-test
```

But we want to know how to run them with SLURM, the scheduler and resource manager for many HPC Centers. To do this we need to create an sbatch script that will ask for the appropriate resources , store our results and log any errors whould they occur for good practice. To do this we have created a __Submit_script.sh__ which serves as a template for submitting a single C++ file that runs the job on the IBM Quantum resources.

```bash
chmod +x Submit_script.sh
sbatch Submit_script.sh
```

__NOTE:__ Arguments on the subit script are written for FSU conventions but can be changed for any HPC resource that uses the scheduler.










