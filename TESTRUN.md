# TEST RUN from zero with small example genome

## Interactive

CAUTION this runs interactively using cpu node

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

## SBATCH JOB

```shell
# clone broad
cd /scratch/$(basename $HOME)
git clone https://github.com/BiCro-HT/broad.git
# run installation
cd broad
bash install.sh test123
# do the test run 
sbatch run_sample.sh test123 # run interactively.
```
