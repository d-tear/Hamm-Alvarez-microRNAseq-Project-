#!/bin/bash

######This script aligns fastq reads to the mouse genome I generated with STAR#######

#cd into directory where the fastq reads are located
cd /media/david/Main/David/microRNASeq/Sarahs_Project/Raw_FastQ_Files/trimmed_ByLength_AndAdapter_R2

#output_dir is where the alignment results for each file will be located
output_dir=/media/david/Main/David/microRNASeq/Sarahs_Project/Alignment_Results/Trimmed_ByLength_AndAdapter_R2


#paramters for STAR alignment
#The last line means: (>=16b matched to the genome, number of mismatches <= 5% of mapped length, i.e. 0MM for 16-19b, 1MM for 20-39b etc, splicing switched off).

params='  --runThreadN 6 
	 	   --runMode alignReads 
        	   --sjdbGTFfile /media/david/Main/David/Genomes/mouse/STAR/gencode.miRNAsubset_vM19.primary_assembly.annotation.gtf 
	 	   --genomeDir /media/david/Main/David/Genomes/mouse/STAR/Genome_Indexes 
	 	   --outSAMtype BAM SortedByCoordinate 
	 	   --quantMode TranscriptomeSAM GeneCounts
		   --outReadsUnmapped Fastx
	  	   --outFilterMismatchNoverLmax 0.05 --outFilterMatchNmin 16 --outFilterScoreMinOverLread 0  --outFilterMatchNminOverLread 0 --alignIntronMax 1
	          '
#Supposedly we can use --genomeLoad LoadAndExit to load the genome index into memory so we can use a for loop to align each fastq file without relaoding the genome each for each fastq file, but I cant get this to work
#STAR --genomeLoad LoadAndExit --genomeDir /media/david/Main/David/Genomes/mouse/STAR/Genome_Indexes


#use for loop to align each fastq file to the genome
for f in $(ls *.fastq | grep "R2")
do

#full file name including extension
input_file="$f"

#filename without extension. We will use this as the prefix for the STAR output files for each fastq file
input_file_name=$(basename "$input_file" .fastq)

#STAR command
STAR --readFilesIn "$f" --outFileNamePrefix "$output_dir"/"$input_file_name" $params
done

#If I could get --genomeLoad LoadAndExit to work, the below line would remove genome index from memory
#STAR --genomeLoad Remove --genomeDir /media/david/Main/David/Genomes/mouse/STAR/Genome_Indexes
