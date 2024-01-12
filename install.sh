#!/bin/bash
MAIN_DIR=$(pwd)
# ------------------- Check if the project name is provided	-------------------
if [ $# -eq 0 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi
PROJECT_NAME="$1"
# ------------------------ Load python3.11.5 and pip -----------------------
export MODULEPATH=/share/apps/spack/new_spack/latest/modules-files/linux-centos8-skylake_avx512:$MODULEPATH
module load python/3.11.5
module load python-3.11.5/py-pip/23.0
# ------------------------ Main part -----------------------
# Install poetry, create a new project, and install the dependencies
pip install poetry
poetry new "$PROJECT_NAME"
cd "$PROJECT_NAME"
mkdir output
poetry add biopython==1.78
poetry add pandas==1.5.3
poetry add pyranges==0.0.95
poetry install
git clone https://github.com/AlagurajVeluchamy/CRISPR-broad.git
# ------------------------ Install bwa -----------------------
BWA_DIR="$HOME/bwa"
# Check if the directory already exists
if [ -d "$BWA_DIR" ]; then
    echo "BWA directory already exists. Skipping..."
else
    # Clone the BWA repository
    git clone https://github.com/lh3/bwa.git "$BWA_DIR"
    cd ~/bwa
    make
    echo 'export PATH=$PATH:~/bwa' >> ~/.bashrc
fi
cd "$MAIN_DIR"