#!/bin/bash

# Load the python3.11.5 and pip
export MODULEPATH=/share/apps/spack/new_spack/latest/modules-files/linux-centos8-skylake_avx512:$MODULEPATH
module load python/3.11.5
module load python-3.11.5/py-pip/23.0

# Install poetry, create a new project, and install the dependencies
pip install poetry
poetry new crspr
cd crspr
mkdir output
poetry add biopython==1.78
poetry add pandas==1.5.3
poetry add pyranges==0.0.95
poetry install
git clone https://github.com/AlagurajVeluchamy/CRISPR-broad.git

# Install bwa
BWA_DIR="$HOME/bwa"
# Check if the directory already exists
if [ -d "$BWA_DIR" ]; then
    echo "BWA directory already exists. Skipping..."
else
    # Clone the BWA repository
    git clone https://github.com/lh3/bwa.git "$BWA_DIR"
    git clone https://github.com/lh3/bwa.git ~/bwa
    cd ~/bwa
    make
    echo 'export PATH=$PATH:~/bwa' >> ~/.bashrc
fi

