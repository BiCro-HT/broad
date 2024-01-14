# broad

install and use [CRISPR-broad](https://github.com/AlagurajVeluchamy/CRISPR-broad). Optimized for the HT-HPC.

## Installation

1. make sure your to set your working directory as your scratch directory

```shell
cd /scratch/$(basename $HOME)
```

2. clone **broad**

```shell
git clone https://github.com/BiCro-HT/broad.git
```

3. create a project inside **broad**

```shell
cd broad
bash install.sh <project_name>
```

> [!IMPORTANT]
> Make sure to change <project_name> with the desired name here and for the rest of instructions.

## Downloading a reference genome

by default an example fasta file inside CRISPR-broad is used as reference genome.
If you want to use a reference genome, you can download hg38 (human genome) or mm10 (mus musculus) using;

```shell
bash download_ref_genome.sh hg38 # human genome
bash download_ref_genome.sh mm10 # mus musculus genome
```

> [!NOTE]
> You only need to download a ref genome once.

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

make sure you downloaded the [reference genome](#downloading-a-reference-genome)
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

For a test run check [TESTRUN.md](testrun.md)