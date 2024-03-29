#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <reference_genome>"
    echo "Example: $0 hg38"
    echo "Available options for reference genomes: hg38 and mm10 and T2T"
    exit 1
fi
reference_genome="$1"

mkdir -p ~/ref/

if [ "$reference_genome" == "mm10" ]; then
    echo "Downloading mm10 reference genome"
    wget -P ~/ref/ http://hgdownload.soe.ucsc.edu/goldenPath/mm10/bigZips/mm10.fa.gz
    gunzip -k ~/ref/mm10.fa.gz
    echo "Downloaded to ~/ref/mm10.fa.gz and unzipped it to ~/ref/mm10.fa"
    echo "Done!"
elif [ "$reference_genome" == "hg38" ]; then
    echo "Downloading hg38 reference genome"
    wget -P ~/ref/ http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz
    gunzip -k ~/ref/hg38.fa.gz
    echo "Downloaded to ~/ref/hg38.fa.gz and unzipped it to ~/ref/hg38.fa"
    echo "Done!"
elif [ "$reference_genome" == "T2T" ]; then
    echo "Copying T2T reference genome"
    wget -P ~/ref/ https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/914/755/GCF_009914755.1_T2T-CHM13v2.0/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna.gz
    gunzip -k ~/ref/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna.gz
    mv ~/ref/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna ~/ref/T2T.fa
else
    echo "Unknown reference genome: $reference_genome"
    exit 1
fi
