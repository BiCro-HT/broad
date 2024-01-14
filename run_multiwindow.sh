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

# We need to modify for paramaters for our case
poetry run python $CB createindex -f $REF_GENOME
poetry run python $CB genomesplit -d ./output -f $REF_GENOME -t 40 -l 23 -g 50 -p GG
poetry run python $CB maptogenome -d ./output -f $REF_GENOME -t 40 -nm 5 -nx 10000 -m 2 -g 50 -l 230
poetry run python $CB filterhits -d ./output -t 40 -nm 5 -nx 10000
poetry run python $CB findwindow -d ./output -t 40 -p GG -w 10000 -l 23 -nm 5 -nw 5 2> ./output/CRISPRs.log # to suppress warnings
# we need a bedfile (-q INPUTBED) and decide on the rest of the parameters
MOD6=" usage: crisprbroad.py findmultiwindow [-h] 
                                      -h, --help            show this help message and exit
                                      -f GENOMESPLITFASTA, --genome_fasta GENOMESPLITFASTA              
                                                            Genome sequence in FASTA format
                                      -d WORKINGDIRECTORY, --working_directory WORKINGDIRECTORY         
                                                            Complete path of output directory
                                      -p PAMSEQUENCE, --pam_sequence PAMSEQUENCE                       
                                                            PAM sequence string eg: NGG
                                      -t THREADS, --num_threads THREADS                            
                                                            Launch t number of threads in parallel
                                      -nm MINHITS, --get_minhits MINHITS                                
                                                            Minimum number of hits in a window (filter)
                                      -nx MAXHITS, --get_maxmum_total_hits MAXHITS                     
                                                            Maximum total number of hits
                                      -ws WINDOW, --get_window WINDOW
                                                            Window size in bp
                                      -sl SLIDINGWINDOWSIZE, --get_slidingwindowlength SLIDINGWINDOWSIZE
                                                            sliding window in bp (For consecutive windows: same as window size)
                                      -nw NUMBEROFWINDOW, --get_multiwindow WINDOW
                                                            number of target windows
                                      -q INPUTBED           --query_bedfile query in bed format
                                                            optional input for finding sgRNA in a given region
                                      -l CANDIDATERNALENGTH, --get_candidaternalength CANDIDATERNALENGTH
                                                            Candidate gRNA length"

MOD7="usage: crisprbroad.py multisgrna [-h] 
                                      -h, --help            show this help message and exit
                                      
                                      -d WORKINGDIRECTORY, --working_directory WORKINGDIRECTORY
                                                            Complete path of output directory
                                      -cb CRISPRBROADRESULTFILE, --crisprbroadresultfilt CRISPRBROADRESULTFILE
                                                            File obtained as result from module5
                                      -mg SGRNANUMBERS, --numberofgRNA NUMBEROFSGRNA
                                                            Number of sgRNA in target window"