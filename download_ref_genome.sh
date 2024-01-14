#!/bin/bash

mkdir -p ~/ref/
wget -P ~/ref/ http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz
gunzip -k ~/ref/hg38.fa.gz

echo "dowloaded to ~/ref/hg38.fa.gz and unzipped it to ~/ref/hg38.fa"
echo "Done!"