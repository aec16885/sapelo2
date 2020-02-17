#PBS -S /bin/bash
#PBS -q batch
#PBS -N chipseq
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/chip_seq/laue_2019/rawfastq_files

module load Trim_Galore/0.4.5-foss-2016b
trim_galore -q --illumina --fastqc -o trimmed_fastq 2_5s1_H3K9me3.fastq 2_5s1_input.fastq 2_5s2_H3K9me3.fastq 2_5s2_input.fastq 4_5s1_H3K9me3.fastq 4_5s1_input.fastq 4_5s2_H3K9me3.fastq 4_5s2_input.fastq 6s1_H3K9me3.fastq 6s1_input.fastq 6s2_H3K9me3.fastq 6s2_input.fastq
