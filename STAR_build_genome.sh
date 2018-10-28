#!/bin/bash


#####This script uses STAR to build the mouse geome index#####

#Note that --genomeChrBinNbits can be reduced reduce RAM consumption. I believe the default is 18
#Note that sjdbOverhang should be set as readlength -1. Because I trimmed the Reads down to 30bp this value is 29

STAR --runThreadN 8 --runMode genomeGenerate  \
--genomeDir /media/david/Main/David/Genomes/mouse/STAR/Genome_Indexes \
--genomeFastaFiles /media/david/Main/David/Genomes/mouse/STAR/GRCm38.primary_assembly.genome.fa \
--sjdbGTFfile /media/david/Main/David/Genomes/mouse/STAR/gencode.vM19.primary_assembly.annotation.gtf \
--sjdbOverhang 29





