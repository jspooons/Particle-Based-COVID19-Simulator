#!/bin/bash
#SBATCH --job-name=experiment2
#SBATCH --output=%x.o%j
#SBATCH --error=%x.e%j
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=12:00:00

module load matlab
matlab - nodisplay -r "run('experiment2_job'); exit;"
