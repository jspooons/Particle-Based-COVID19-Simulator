#!/bin/bash
#SBATCH --job-name=experiment3
#SBATCH --output=%x.o%j
#SBATCH --error=%x.e%j
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=48:00:00

module load matlab
matlab -nodisplay -r "run('experiment3_job'); exit;"
