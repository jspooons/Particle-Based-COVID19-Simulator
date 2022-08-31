# Particle-Based-COVID-19-Simulator
## Requirements:
1. OS Windows/Linux/Mac.
2. MATLAB R2019/R2020. 

## Particle-Based COVID-19 Simulator with Social Contact Network, network based lockdown implementation and individual level mask wearing implementation.



Link to the original paper that the work on this page extends: https://ieeexplore.ieee.org/document/9372866

### How to use?
In order to replicate results in my paper, run the **main_lecco.m** file

### How to use?
- To calibrate the model, use **main_v2.m** script. It is basically a modified version of the **main_lecco.m** script. 
We included an additional state, age, to make transitions from the Infected/Isolated state to the Severely Infected state based on the ages of particles. Then, you can use the calibrated model to simulate different vaccination strategies. You can also
download the calibrated model, used in the paper, for the province of Lecco from [here](https://drive.google.com/drive/folders/1JbNz1FaX1_lCMfWsKwQ-ZWPr47z7v6eA?usp=sharing). 
- To simulate effective immunization cases (random vaccination/age based vaccination) for particles above 19, use **effective_vaccination.m** script.
- To simulate effective immunization cases (random vaccination/age based vaccination) for particles between 19-69, use **effective_vaccination_v2.m** script.
- To simulate sterilizing immunization cases (random vaccination/age based vaccination) for particles above 19, use **sterilizing_vaccination.m** script.
- To simulate sterilizing immunization cases (random vaccination/age based vaccination) for particles between 19-69, use **sterilizing_vaccination_v2.m** script.

# Note:
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


