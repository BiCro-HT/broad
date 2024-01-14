# broad install and use

## Clone this repository

To your **/scratch/name.lastname/** directory.

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

## Sample Run: Interactive

You may change your **RAM** needs accordingly, here it is 32GB..

```shell
srun --nodes=1 --mem-per-cpu=32GB --partition=cpu-interactive  --pty /bin/bash
poetry shell
source run_int.sh <project_name>
```

## Sample Run: sbatch JOB

*DOES NOT WORK YET.*

```shell
sbatch run_sample.sh
```

## TEST RUN from zero

```shell
cd /scratch/$(basename $HOME)
git clone https://github.com/BiCro-HT/broad.git
cd broad
bash install.sh test123
cd test123
srun --nodes=1 --mem-per-cpu=32GB --partition=cpu-interactive  --pty /bin/bash
poetry shell
cd ..
source run_int.sh test123
```
