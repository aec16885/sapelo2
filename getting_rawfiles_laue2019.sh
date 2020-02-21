#PBS -S /bin/bash
#PBS -q batch
#PBS -N chipseq
#PBS -l nodes=1:ppn=12:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/chip_seq

mkdir laue_2019
cd laue_2019

mkdir SRAfastq_files
mkdir SRA_files
mkdir rawfastq_files
cd SRA_files

#2_5s1 H3K9me3
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996310'
#2_5s1 input
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996309'
#2_5s2 H3K9me3
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996308'
#2_5s2 input
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996307'
#4_5s1 H3K9me3
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996306'
#4_5s1 input
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996305'
#4_5s2 H3K9me3
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996304'
#4_5s2 input
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996303'
#6s1 H3K9me3
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996302'
#6s1 input
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996301'
#6s2 H3K9me3
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996300'
#6s2 input
wget 'https://sra-download.ncbi.nlm.nih.gov/traces/sra61/SRR/006832/SRR6996299'

#convert SRA files to fasta files
module load SRA-Toolkit/2.9.1-centos_linux64
fasterq-dump SRR6996310 -O ../SRAfastq_files/2_5s1_H3K9me3.fastq
fasterq-dump SRR6996309 -O ../SRAfastq_files/2_5s1_input.fastq
fasterq-dump SRR6996308 -O ../SRAfastq_files/2_5s2_H3K9me3.fastq
fasterq-dump SRR6996307 -O ../SRAfastq_files/2_5s2_input.fastq
fasterq-dump SRR6996306 -O ../SRAfastq_files/4_5s1_H3K9me3.fastq
fasterq-dump SRR6996305 -O ../SRAfastq_files/4_5s1_input.fastq
fasterq-dump SRR6996304 -O ../SRAfastq_files/4_5s2_H3K9me3.fastq
fasterq-dump SRR6996303 -O ../SRAfastq_files/4_5s2_input.fastq
fasterq-dump SRR6996302 -O ../SRAfastq_files/6s1_H3K9me3.fastq
fasterq-dump SRR6996301 -O ../SRAfastq_files/6s1_input.fastq
fasterq-dump SRR6996300 -O ../SRAfastq_files/6s2_H3K9me3.fastq
fasterq-dump SRR6996299 -O ../SRAfastq_files/6s2_input.fastq

cd ..
scp SRAfastq_files/SRR6996310.fastq rawfastq_files/2_5s1_H3K9me3.fastq
scp SRAfastq_files/SRR6996309.fastq rawfastq_files/2_5s1_input.fastq
scp SRAfastq_files/SRR6996308.fastq rawfastq_files/2_5s2_H3K9me3.fastq
scp SRAfastq_files/SRR6996307.fastq rawfastq_files/2_5s2_input.fastq
scp SRAfastq_files/SRR6996306.fastq rawfastq_files/4_5s1_H3K9me3.fastq
scp SRAfastq_files/SRR6996305.fastq rawfastq_files/4_5s1_input.fastq
scp SRAfastq_files/SRR6996304.fastq rawfastq_files/4_5s2_H3K9me3.fastq
scp SRAfastq_files/SRR6996303.fastq rawfastq_files/4_5s2_input.fastq
scp SRAfastq_files/SRR6996302.fastq rawfastq_files/6s1_H3K9me3.fastq
scp SRAfastq_files/SRR6996301.fastq rawfastq_files/6s1_input.fastq
scp SRAfastq_files/SRR6996300.fastq rawfastq_files/6s2_H3K9me3.fastq
scp SRAfastq_files/SRR6996299.fastq rawfastq_files/6s2_input.fastq
