# broad install and use

## Clone this repository

```shell
git clone https://github.com/BiCro-HT/broad.git
cd broad
```

## Install

change <project_name> with your desired name.

```shell
bash install.sh <project_name>
```

## Sample Run: Interactive

You may change your RAM needs accordingly, here it is 32GB..

```shell
srun --nodes=1 --mem-per-cpu=32GB --partition=cpu-interactive  --pty /bin/bash
source run_int.sh <project_name>
```

## Sample Run: sbatch JOB

*DOES NOT WORK YET.*

```shell
sbatch run_sample.sh
```

## TEST RUN from zero

```shell
git clone https://github.com/BiCro-HT/broad.git
cd broad
bash install.sh <project_name>
srun --nodes=1 --mem-per-cpu=32GB --partition=cpu-interactive  --pty /bin/bash
source run_int.sh <project_name>
```