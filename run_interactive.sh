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
# Runs using the current poetry environment
poetry run python $CB createindex -f "$CB_DIR/Inputgenome.fa"
poetry run python $CB genomesplit -d ./output -f "$CB_DIR/Inputgenome.fa" -t 40 -l 23 -g 50 -p GG
poetry run python $CB maptogenome -d ./output -f "$CB_DIR/Inputgenome.fa" -t 40 -nm 5 -nx 10000 -m 2 -g 50 -l 230
poetry run python $CB filterhits -d ./output -t 40 -nm 5 -nx 10000
poetry run python $CB findwindow -d ./output -t 40 -p GG -w 10000 -l 23 -nm 5 -nw 5 2> ./output/CRISPRs.log # to suppress warnings