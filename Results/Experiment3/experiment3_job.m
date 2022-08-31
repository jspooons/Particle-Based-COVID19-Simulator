% prepare the desktop
close all; clear; clc;
cd('/local/software/matlab/mdcs');
parallel.importProfile('Slurm.settings');
parallel.defaultClusterProfile('SlurmProfile');
cd('/mainfs/lyceum/jws1e21/git/Particle-Based-COVID19-Simulator');
c = parcluster;
c.AdditionalProperties.AdditionalSubmitArgs = ...
	['--nodes=1 --ntasks=1 --time=48:00:00'];
job = createJob(c);
id = job.ID
t = createTask(job, @main_lecco, 0, {...
{33700,3,2500,3,50,1.0,0.0,0.0,0.33,1,1,1,3,id,1},...
{33700,3,2500,3,50,1.0,0.2,0.0,0.33,1,1,1,3,id,2},...
{33700,3,2500,3,50,1.0,0.4,0.0,0.33,1,1,1,3,id,3},...
{33700,3,2500,3,50,1.0,0.6,0.0,0.33,1,1,1,3,id,4},...
{33700,3,2500,3,50,1.0,0.8,0.0,0.33,1,1,1,3,id,5},...
{33700,3,2500,3,50,1.0,1.0,0.0,0.33,1,1,1,3,id,6},...
{33700,3,2500,3,50,1.0,0.0,0.2,0.33,1,1,1,3,id,7},...
{33700,3,2500,3,50,1.0,0.2,0.2,0.33,1,1,1,3,id,8},...
{33700,3,2500,3,50,1.0,0.4,0.2,0.33,1,1,1,3,id,9},...
{33700,3,2500,3,50,1.0,0.6,0.2,0.33,1,1,1,3,id,10},...
{33700,3,2500,3,50,1.0,0.8,0.2,0.33,1,1,1,3,id,11},...
{33700,3,2500,3,50,1.0,1.0,0.2,0.33,1,1,1,3,id,12},...
{33700,3,2500,3,50,1.0,0.0,0.4,0.33,1,1,1,3,id,13},...
{33700,3,2500,3,50,1.0,0.2,0.4,0.33,1,1,1,3,id,14},...
{33700,3,2500,3,50,1.0,0.4,0.4,0.33,1,1,1,3,id,15},...
{33700,3,2500,3,50,1.0,0.6,0.4,0.33,1,1,1,3,id,16},...
{33700,3,2500,3,50,1.0,0.8,0.4,0.33,1,1,1,3,id,17},...
{33700,3,2500,3,50,1.0,1.0,0.4,0.33,1,1,1,3,id,18},...
{33700,3,2500,3,50,1.0,0.0,0.6,0.33,1,1,1,3,id,19},...
{33700,3,2500,3,50,1.0,0.2,0.6,0.33,1,1,1,3,id,20},...
{33700,3,2500,3,50,1.0,0.4,0.6,0.33,1,1,1,3,id,21},...
{33700,3,2500,3,50,1.0,0.6,0.6,0.33,1,1,1,3,id,22},...
{33700,3,2500,3,50,1.0,0.8,0.6,0.33,1,1,1,3,id,23},...
{33700,3,2500,3,50,1.0,1.0,0.6,0.33,1,1,1,3,id,24},...
{33700,3,2500,3,50,1.0,0.0,0.8,0.33,1,1,1,3,id,25},...
{33700,3,2500,3,50,1.0,0.2,0.8,0.33,1,1,1,3,id,26},...
{33700,3,2500,3,50,1.0,0.4,0.8,0.33,1,1,1,3,id,27},...
{33700,3,2500,3,50,1.0,0.6,0.8,0.33,1,1,1,3,id,28},...
{33700,3,2500,3,50,1.0,0.8,0.8,0.33,1,1,1,3,id,29},...
{33700,3,2500,3,50,1.0,1.0,0.8,0.33,1,1,1,3,id,30},...
{33700,3,2500,3,50,1.0,0.0,1.0,0.33,1,1,1,3,id,31},...
{33700,3,2500,3,50,1.0,0.2,1.0,0.33,1,1,1,3,id,32},...
{33700,3,2500,3,50,1.0,0.4,1.0,0.33,1,1,1,3,id,33},...
{33700,3,2500,3,50,1.0,0.6,1.0,0.33,1,1,1,3,id,34},...
{33700,3,2500,3,50,1.0,0.8,1.0,0.33,1,1,1,3,id,35},...
{33700,3,2500,3,50,1.0,1.0,1.0,0.33,1,1,1,3,id,36},...
{33700,3,2500,3,50,1.0,0.0,0.0,0.66,1,1,1,3,id,37},...
{33700,3,2500,3,50,1.0,0.2,0.0,0.66,1,1,1,3,id,38},...
{33700,3,2500,3,50,1.0,0.4,0.0,0.66,1,1,1,3,id,39},...
{33700,3,2500,3,50,1.0,0.6,0.0,0.66,1,1,1,3,id,40},...
{33700,3,2500,3,50,1.0,0.8,0.0,0.66,1,1,1,3,id,41},...
{33700,3,2500,3,50,1.0,1.0,0.0,0.66,1,1,1,3,id,42},...
{33700,3,2500,3,50,1.0,0.0,0.2,0.66,1,1,1,3,id,43},...
{33700,3,2500,3,50,1.0,0.2,0.2,0.66,1,1,1,3,id,44},...
{33700,3,2500,3,50,1.0,0.4,0.2,0.66,1,1,1,3,id,45},...
{33700,3,2500,3,50,1.0,0.6,0.2,0.66,1,1,1,3,id,46},...
{33700,3,2500,3,50,1.0,0.8,0.2,0.66,1,1,1,3,id,47},...
{33700,3,2500,3,50,1.0,1.0,0.2,0.66,1,1,1,3,id,48},...
{33700,3,2500,3,50,1.0,0.0,0.4,0.66,1,1,1,3,id,49},...
{33700,3,2500,3,50,1.0,0.2,0.4,0.66,1,1,1,3,id,50},...
{33700,3,2500,3,50,1.0,0.4,0.4,0.66,1,1,1,3,id,51},...
{33700,3,2500,3,50,1.0,0.6,0.4,0.66,1,1,1,3,id,52},...
{33700,3,2500,3,50,1.0,0.8,0.4,0.66,1,1,1,3,id,53},...
{33700,3,2500,3,50,1.0,1.0,0.4,0.66,1,1,1,3,id,54},...
{33700,3,2500,3,50,1.0,0.0,0.6,0.66,1,1,1,3,id,55},...
{33700,3,2500,3,50,1.0,0.2,0.6,0.66,1,1,1,3,id,56},...
{33700,3,2500,3,50,1.0,0.4,0.6,0.66,1,1,1,3,id,57},...
{33700,3,2500,3,50,1.0,0.6,0.6,0.66,1,1,1,3,id,58},...
{33700,3,2500,3,50,1.0,0.8,0.6,0.66,1,1,1,3,id,59},...
{33700,3,2500,3,50,1.0,1.0,0.6,0.66,1,1,1,3,id,60},...
{33700,3,2500,3,50,1.0,0.0,0.8,0.66,1,1,1,3,id,61},...
{33700,3,2500,3,50,1.0,0.2,0.8,0.66,1,1,1,3,id,62},...
{33700,3,2500,3,50,1.0,0.4,0.8,0.66,1,1,1,3,id,63},...
{33700,3,2500,3,50,1.0,0.6,0.8,0.66,1,1,1,3,id,64},...
{33700,3,2500,3,50,1.0,0.8,0.8,0.66,1,1,1,3,id,65},...
{33700,3,2500,3,50,1.0,1.0,0.8,0.66,1,1,1,3,id,66},...
{33700,3,2500,3,50,1.0,0.0,1.0,0.66,1,1,1,3,id,67},...
{33700,3,2500,3,50,1.0,0.2,1.0,0.66,1,1,1,3,id,68},...
{33700,3,2500,3,50,1.0,0.4,1.0,0.66,1,1,1,3,id,69},...
{33700,3,2500,3,50,1.0,0.6,1.0,0.66,1,1,1,3,id,70},...
{33700,3,2500,3,50,1.0,0.8,1.0,0.66,1,1,1,3,id,71},...
{33700,3,2500,3,50,1.0,1.0,1.0,0.66,1,1,1,3,id,72}});
submit(job);
