#!/bin/bash

# -------------------- Check if the project name is provided --------------------
if [ $# -eq 0 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi
PROJECT_NAME="$1"
cd "$PROJECT_NAME"
# ------------------------ Main part -----------------------
CB_DIR="$HOME/CRISPR-broad"
CB="$CB_DIR/crisprbroad.py"

python $CB createindex -f "$CB_DIR/Inputgenome.fa"
python $CB genomesplit -d ./output -f "$CB_DIR/Inputgenome.fa" -t 40 -l 23 -g 50 -p GG
python $CB maptogenome -d ./output -f "$CB_DIR/Inputgenome.fa" -t 40 -nm 5 -nx 10000 -m 2 -g 50 -l 230
python $CB filterhits -d ./output -t 40 -nm 5 -nx 10000
python $CB findwindow -d ./output -t 40 -p GG -w 10000 -l 23 -nm 5 -nw 5 2> ./output/CRISPRs.log # suppress warnings