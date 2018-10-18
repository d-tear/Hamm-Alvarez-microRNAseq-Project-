#!/bin/bash

##This script uses cutadapt to trim reads


input_dir="/media/david/Main/David/microRNASeq/Sarahs_Project/Raw_FastQ_Files"
output_dir="/media/david/Main/David/microRNASeq/Sarahs_Project/Raw_FastQ_Files/trimmed_R2"

adapter_seq="GATCGTCGGACTGTAG"

#cd into directory where raw fastq reads are located. Ensure pigz is installed if you are working with .gz files so cutadapt can use multiple cores
cd $input_dir

#specify input file
input_file="G1N_R2_001.fastq.gz"

#specify the input filename (without extension) 
input_file_name=$(basename $input_file .fastq.gz)

prefix="trimmed_"

output_file="$output_dir/$prefix$input_file"

report_prefix="CutadaptReport_"

report_extension=".txt"

#cutadapt command
cutadapt -a GATCGTCGGACTGTAG --cores=6 "$input_file" > "$output_file" 2> "$output_dir/$report_prefix$input_file_name$report_extension"
