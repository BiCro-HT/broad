#!/bin/bash

# -------------------- Check if the project name is provided --------------------
if [ $# -eq 0 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi
PROJECT_NAME="$1"
cd "$PROJECT_NAME"
# ------------------------ Main part -----------------------
python CRISPR-broad/crisprbroad.py genomesplit -d ./output -f CRISPR-broad/Inputgenome.fa -t 40 -l 23 -g 50 -p GG
python CRISPR-broad/crisprbroad.py createindex -f CRISPR-broad/Inputgenome.fa
python CRISPR-broad/crisprbroad.py maptogenome -d ./output -f CRISPR-broad/Inputgenome.fa -t 40 -nm 5 -nx 10000 -m 2 -g 50 -l 230
python CRISPR-broad/crisprbroad.py filterhits -d ./output -t 40 -nm 5 -nx 10000
python CRISPR-broad/crisprbroad.py findwindow -d ./output -t 40 -p GG -w 10000 -l 23 -nm 5 -nw 5