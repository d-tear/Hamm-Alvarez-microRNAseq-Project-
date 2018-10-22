#!/bin/bash

################This script uses cutadapt to trim reads#################
##Libraries were prepared with the Illumina TruSeq Small RNA library prep kit

##For the R1 reads, there is substantial contamination at the 3' end of the reads with this adapter sequence: 5’ TGGAATTCTCGGGTGCCAAGG 3’ 
#Note that this is the Truseq Small RNA RA3 adapter
#RNA 3’ Adapter (RA3): 5’ TGGAATTCTCGGGTGCCAAGG 3’

##For the R2 reads, there is substantial contamination at the 3' ends of the reads with this adapter sequence: 5' GATCGTCGGACTGTAGAACTCTGAAC 3'
# Note that this is the reverse complement of the Truseq Small RNA RA5 adapter
#RNA 5’ Adapter (RA5): 5’ GUUCAGAGUUCUACAGUCCGACGAUC 3' 
# Reverse DNA complewment (U's replaced with T's): 5' GATCGTCGGACTGTAGAACTCTGAAC 3'

input_dir="/media/david/Main/David/microRNASeq/Sarahs_Project/Raw_FastQ_Files"
output_dir="/media/david/Main/David/microRNASeq/Sarahs_Project/Raw_FastQ_Files/trimmed_ByLength_R2"

#what file type should cutadapt output
output_extension=".fastq"

#I am currently analyzing the R2 reads, so I used approximately the first half of the RA5 adapter sequence
adapter_seq="GATCGTCGGACTGTAG"

#cd into directory where raw fastq reads are located. Ensure pigz is installed if you are working with .gz files so cutadapt can use multiple cores
cd $input_dir

#we will add this prefix to our files output from cutadapt
prefix="trimmed_ByLength_"

# we will add this prefix to our report files generated from cutadapt
report_prefix="CutadaptReport_"

# we will save the reports as txt files
report_extension=".txt"





for f in $(ls *.gz | grep "R2")
do

#full file name including extension
input_file="$f"

#filename without extension
input_file_name=$(basename $input_file .fastq.gz)

#output file from cutadapt
output_file="$output_dir/$prefix$input_file_name$output_extension"

cutadapt -m 15 -M 31 --cores=6 "$input_file" > "$output_file" 2> "$output_dir/$report_prefix$input_file_name$report_extension"

done


