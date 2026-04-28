#!/bin/bash

# Nastavení a instalace 
# sudo apt update
# sudo apt install sra-toolkit hisat2 samtools subread wget

# Stazeni RNA-seq dat - vybrala jsem si run: SRR1777112
fasterq-dump SRR1777112 --split-files --progress

# Priprava referencniho genomu (hg38) 
mkdir -p references && cd references
wget https://genome-idx.s3.amazonaws.com/hisat/hg38_genome.tar.gz
tar -xvzf hg38_genome.tar.gz
cd ..

# Mapovani na genom 
# Pouzivam HISAT2, prevod na BAM a sorting pomoci samtools
hisat2 -p 8 -x references/hg38/genome -1 SRR1777112_1.fastq -2 SRR1777112_2.fastq | \
samtools view -bS - | \ samtools sort -o SRR1777112_sorted.bam

# Indexace BAM souboru pro vizualizaci v IGV
samtools index SRR1777112_sorted.bam

# Stazeni anotace (GTF) a pocitani counts 
wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_44/gencode.v44.primary_assembly.annotation.gtf.gz
gunzip gencode.v44.primary_assembly.annotation.gtf.gz

# featureCounts: 
# -p (rika ze se jedna o paired-end), -g gene_name (aby v tabulce byly názvy jako S100A16)
featureCounts -p -T 8 -g gene_name \
-a gencode.v44.primary_assembly.annotation.gtf \
-o counts.txt SRR1777112_sorted.bam
