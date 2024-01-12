srun --nodes=1 --mem-per-cpu=32GB --partition=cpu-interactive  --pty /bin/bash
poetry shell
python crisprbroad.py genomesplit -d ../output -f Inputgenome.fa -t 40 -l 23 -g 50 -p GG
python crisprbroad.py createindex -f Inputgenome.fa
python crisprbroad.py maptogenome -d ../output -f Inputgenome.fa -t 40 -nm 5 -nx 10000 -m 2 -g 50 -l 230
python crisprbroad.py filterhits -d ../output -t 40 -nm 5 -nx 10000
python crisprbroad.py findwindow -d ../output -t 40 -p GG -w 10000 -l 23 -nm 5 -nw 5