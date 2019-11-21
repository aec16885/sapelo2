#PBS -S /bin/bash
#PBS -q batch
#PBS -N sam_bam
#PBS -l nodes=2:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1_RNAseq/bowtie

module load SAMtools/1.6-foss-2016b
samtools view -b n1_allignment.sam > n1_allignment.bam
samtools view -b n2_allignment.sam > n2_allignment.bam
samtools view -b n3__allignment.sam > n3_allignment.bam
samtoosl view -b wt1_allignment.sam > wt1_allignment.bam
samtools view -b wt2_allignment.sam > wt2_allignment.bam
samtools view -b wt3__allignment.sam > wt3_allignment.bam

samtools sort -o n1_sorted.bam n1_allignment.bam
samtools sort -o n2_sorted.bam n2_allignment.bam
samtools sort -o n3_sorted.bam n3_allignment.bam
samtools sort -o wt1_sorted.bam wt1_allignment.bam
samtools sort -o wt2_sorted.bam wt2_allignment.bam 
samtools sort -o wt3_sorted bam wt3_allignment.bam
