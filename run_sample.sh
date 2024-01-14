#!/bin/bash 
#SBATCH --job-name=crispr_broad
#SBATCH --mail-type=ALL
#SBATCH --partition=cpuq
#SBATCH --time=47:59:59
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --output=job_name_%j.log
#SBATCH --mem-per-cpu=1024M

# -------------------- Check if the project name is provided --------------------
if [ $# -eq 0 ]; then
    echo "Usage: $0 <project_name>"
    echo "also you can provide a reference genome..."
    echo "Usage: $0 <project_name> <reference_genome>"
    exit 1
fi
PROJECT_NAME="$1"
cd "$PROJECT_NAME"

CB_DIR="$HOME/CRISPR-broad"
CB="$CB_DIR/crisprbroad.py"


# ------------------------ Check if the reference genome is provided -----------------------
if [ $# -eq 2 ]; then
    REF_GENOME="$HOME/ref/$2.fa"
    echo "Using $REF_GENOME as the reference genome"
else
    REF_GENOME="$CB_DIR/Inputgenome.fa"
    echo "no reference genome provided... Using $REF_GENOME as the reference genome"
fi

# Runs using the current poetry environment
poetry run python $CB createindex -f $REF_GENOME
poetry run python $CB genomesplit -d ./output -f $REF_GENOME -t 40 -l 23 -g 50 -p GG
poetry run python $CB maptogenome -d ./output -f $REF_GENOME -t 40 -nm 5 -nx 10000 -m 2 -g 50 -l 230
poetry run python $CB filterhits -d ./output -t 40 -nm 5 -nx 10000
poetry run python $CB findwindow -d ./output -t 40 -p GG -w 10000 -l 23 -nm 5 -nw 5 2> ./output/CRISPRs.log # to suppress warnings