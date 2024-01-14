# broad

install and use [CRISPR-broad](https://github.com/AlagurajVeluchamy/CRISPR-broad). Optimized for the HT-HPC.

## Installation

1. make sure your to set your working directory as your scratch directory

```shell
cd /scratch/$(basename $HOME)
```

2. clone **broad**

```shell
git clone https://github.com/BiCro-HT/broad.git /scratch/$(basename $HOME)
```

3. create a project inside **broad**

```shell
cd broad
bash install.sh <project_name>
```

## Usage

make sure to go to **installation directory**, use the following;

```shell
cd /scratch/$(basename $HOME)/broad/
```

**After Going to installation directory**

you may use  **Job** or **Interactive** run.
For **real work** definetely use the [JOB](#job)

### JOB

Send the work as a sbatch job.


```shell
sbatch run_sample.sh <project_name> <reference_genome>
```

by default an example fasta file inside CRISPR-broad is used as reference genome.
If you want to use a reference genome, you can download hg38 (human genome) or mm10 (mus musculus) using.

```shell
bash download_ref_genome hg38 # human genome
bash download_ref_genome mm10 # human genome
```

after the download..

```shell
sbatch run_sample.sh <project_name> hg38 # or mm10
```

### Interactive

Just as an option but **highly discouraged**

```shell
srun --nodes=1 --mem-per-cpu=32GB --partition=cpu-interactive  --pty /bin/bash
bash run_interactive.sh <project_name> 
```

## TEST RUN from zero with small example genome

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
