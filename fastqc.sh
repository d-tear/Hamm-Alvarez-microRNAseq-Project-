#!/bin/bash

##This script runs FastQC on the R2 or R1 reads. Shruti is examining the R1 reads. I'm examining the R2 reads



#add FastQC to PATH
export PATH=/home/david/FastQC:${PATH}

#specify where FastQC should generate output files
output_dir="/media/david/Main/David/microRNASeq/Sarahs_Project/Raw_FastQ_Files/untrimmed_R1_fastqc_results"

#cd into directory where fastq files are located
cd /media/david/Main/David/microRNASeq/Sarahs_Project/Raw_FastQ_Files

#use for loop to run FastQC on each R2 or R1 file and save the output in the specified output directory. Alternatively you could also just run FastQC on all the fastq files
for f in $(ls | grep "R1")
do
fastqc --outdir="$output_dir" "$f"
done


