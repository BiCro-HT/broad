# broad

install and use CRISPR-broad.

## TEST RUN from zero

```shell
# clone broad
cd /scratch/$(basename $HOME)
git clone https://github.com/BiCro-HT/broad.git
# run installation
cd broad
bash install.sh test123
# do the test run 
srun --nodes=1 --mem-per-cpu=32GB --partition=cpu-interactive  --pty /bin/bash # in interactive session...
bash run_interactive.sh test123 # run interactively.
```

## Step-by-step

### Clone this repository

To your **/scratch/name.lastname/** directory.

```shell
cd /scratch/$(basename $HOME)
git clone https://github.com/BiCro-HT/broad.git
cd broad
```

### Install

change **<project_name>** with your desired name.

```shell
bash install.sh <project_name>
```

### 1. Sample Run: Interactive

You may change your **RAM** needs accordingly, here it is 32GB..
Inside your project directory 

```shell
srun --nodes=1 --mem-per-cpu=32GB --partition=cpu-interactive  --pty /bin/bash
bash run_interactive.sh <project_name>
```

### 2. Sample Run: sbatch JOB

```shell
sbatch run_sample.sh <project_name>
```

## Use after installation

- make sure to go installation directory, use the following;

```shell
cd /scratch/$(basename $HOME)/broad/
```

you may use **Interactive** or **Job** run

### Interactive

from [1. Sample Run: Interactive](#1-sample-run-interactive)

```shell
srun --nodes=1 --mem-per-cpu=32GB --partition=cpu-interactive  --pty /bin/bash
bash run_interactive.sh <project_name>
```

### JOB

from [2. Sample Run: sbatch JOB](#2-sample-run-sbatch-job)

```shell
sbatch run_sample.sh <project_name>
```
