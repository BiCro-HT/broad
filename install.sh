#!/bin/bash
MAIN_DIR=$(pwd)

# Using without square brackets
if ! grep -qxF 'export PATH=$PATH:~/.local/bin' ~/.bashrc; then
    echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
    echo "writing to bashrc.. PATH ~/.local/bin"
    source ~/.bashrc
else
    echo "~/.local/bin is already in ~/.bashrc"
fi

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
export PATH=$PATH:~/.local/bin
pip install poetry
poetry config virtualenvs.in-project false
poetry new "$PROJECT_NAME"
cd "$PROJECT_NAME"
mkdir output
poetry add biopython==1.78
poetry add pandas==1.5.3 # same thing but this one installs
poetry add pyranges==0.0.129 # prevents numpy bool errors
poetry install

# ---------------------- Install CRISPR-broad to HOME ---------------------
git clone https://github.com/Zaf4/CRISPR-broad.git $HOME/CRISPR-broad # for now from Zaf4's fork..
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
    source ~/.bashrc
fi
cd "$MAIN_DIR"