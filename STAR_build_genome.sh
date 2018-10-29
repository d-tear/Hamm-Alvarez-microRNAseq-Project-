#!/bin/bash


#####This script uses STAR to build the mouse geome index#####

#Note that --genomeChrBinNbits can be reduced to reduce RAM consumption. I believe the default is 18..
#Note that sjdbOverhang should be set as readlength -1 for optimal performance. The ENCODE STAR protocol for miRNA sequencing uses --sjdbOverhang 1. This is a hack to prohibit splicing over annotated junctions in the GTF, but still use the GTF for counting reads over genes.
#If you do not need counting over genes in the GTF file, you can omit the --sjdbGTFfile and --sjdbOverhang parameters altogether.
#--runThreadN can be set to a higher number than the number of physical cores if the system has hyperthreading capabilities

STAR --runThreadN 10 --runMode genomeGenerate  \
--genomeDir /media/david/Main/David/Genomes/mouse/STAR/Genome_Indexes \
--genomeFastaFiles /media/david/Main/David/Genomes/mouse/STAR/GRCm38.primary_assembly.genome.fa \
--sjdbGTFfile /media/david/Main/David/Genomes/mouse/STAR/gencode.vM19.primary_assembly.annotation.gtf \
--sjdbOverhang 1





