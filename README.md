# Particle-Based-COVID-19-Simulator
## Requirements:
1. OS Windows/Linux/Mac.
2. MATLAB R2019/R2020. 

## Particle-Based COVID-19 Simulator with Social Contact Network, network based lockdown implementation and individual level mask wearing implementation.



Link to the original paper that the work on this page extends: https://ieeexplore.ieee.org/document/9372866

### How to use?
In order to replicate results in my paper, run the **main_lecco.m** file

### How to use?
- Run 'sbatch experimentX_slurm.script' in a terminal (currently job and script files reside in Results/ExperimentX folders)
- Make sure the .script file, the job.m file, and the program files are all in the same location
- In the job.m file, to fine tune the parameters for an experiment, you first need to understand the roles each parameter plays, here is a description:

main_lecco(N, NUM_E, INITIAL, GROWTH, MAX, P_NW, P_LD, P_MP, P_MT, n_flag, l_flag, m_flag, ExpID, jobID, taskID)
                        
- N - population size
- NUM_E - number of inially exposed particles
- INITIAL - initial size of the Barabasi-Albert network before the generative process adds the remainder of the particles to the social network
- GROWTH - growth factor, the number of new connections that each particle makes when added to the initial BA network
- MAX - maximum degree a node can have in the BA network
- P_NW - probability that an interaction is a random interaction that occurs in the environment, or if the interaction is between a contact of the infectious particle that makes the interaction
- P_LD - proportion of the population that will be locked down
- P_LD - proportion of the population that will be enforced to wear masks
- P_MT - probability that a mask wearer is wearing their mask at time T
- n_flag - raised (set to 1, or 0 if not raised) if a network is being used
- l_flag - raised if a lockdown will be enforced
- m_flag - raised if mask wearing will be enfored
- ExpID - experiment identification, different experiments disable and enable different parts of the code
- jobID - slurms scheduler job id
- taskID - Slurm scheduler task id

# Note:
- Results folder contains all of the results for each experiment
- Jupyter nodebooks in each Results/ExperimentX file, which analyse all of the graphs and tables


Citation of the original paper that is being extended:
```
@ARTICLE{9372866,
  author={A. {Kuzdeuov} and A. {Karabay} and D. {Baimukashev} and B. {Ibragimov} and H. A. {Varol}},
  journal={IEEE Open Journal of Engineering in Medicine and Biology}, 
  title={A Particle-Based COVID-19 Simulator With Contact Tracing and Testing}, 
  year={2021},
  volume={2},
  number={},
  pages={111-117},
  doi={10.1109/OJEMB.2021.3064506}}
```


