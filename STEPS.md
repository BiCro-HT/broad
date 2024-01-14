# Step-by-step

## Clone this repository

To your **/scratch/name.lastname/** directory. 
Simply, copy and paste the following to your terminal.

```shell
cd /scratch/$(basename $HOME)
git clone https://github.com/BiCro-HT/broad.git
cd broad
```

## Install

change **<project_name>** with your desired name.

```shell
bash install.sh <project_name>
```

## 1. Sample Run: Interactive

You may change your **RAM** needs accordingly, here it is 32GB..
Inside your project directory 

```shell
srun --nodes=1 --mem-per-cpu=32GB --partition=cpu-interactive  --pty /bin/bash
bash run_interactive.sh <project_name>
```

## 2. Sample Run: sbatch JOB

```shell
sbatch run_sample.sh <project_name>
```