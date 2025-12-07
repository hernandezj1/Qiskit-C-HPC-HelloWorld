#!/bin/bash
#SBATCH -J qiskit-job
#SBATCH -t 00:30:00
#SBATCH -A genacc_q
#SBATCH -n 1

#This will vary by HPC center but make sure you can access the web for submission
module load webproxy

# Load conda and activate your environment
module load anaconda
source activate ~/.conda/envs/quantum_c

./qiskit-cpp/samples/build/sampler_test
