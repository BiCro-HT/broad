#!/bin/bash 
#SBATCH --job-name=crispr_broad
#SBATCH --mail-type=ALL
#SBATCH --partition=cpuq
#SBATCH --time=47:59:59
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --output=job_name_%j.log
#SBATCH --mem-per-cpu=1024M

#srun --time=4:00:00 --mem=100G --nodes=1 -c 40 --pty bash -l
poetry shell
python crisprbroad.py genomesplit -d ../output -f Inputgenome.fa -t 40 -l 23 -g 50 -p GG
python crisprbroad.py createindex -f Inputgenome.fa
python crisprbroad.py maptogenome -d ../output -f Inputgenome.fa -t 40 -nm 5 -nx 10000 -m 2 -g 50 -l 230
python crisprbroad.py filterhits -d ../output -t 40 -nm 5 -nx 10000
python crisprbroad.py findwindow -d ../output -t 40 -p GG -w 10000 -l 23 -nm 5 -nw 5

