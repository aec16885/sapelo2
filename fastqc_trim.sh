#PBS -S /bin/bash
#PBS -q batch
#PBS -N fastqc_trim
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1_RNAseq/bowtie

module load FastQC/0.11.8-Java-1.8.0_144

mkdir fastqc_trim_dir

fastqc  n1_R1.trim.gz n1_R2.trim.gz n2_R1.trim.gz n2_R2.trim.gz n3_R1.trim.gz n3_R2.trim.gz wt1_r1.trim.gz wt1_r2.trim.gz wt2_r1.trim.gz wt2_r2.trim.gz wt3_r1.trim.gz wt3_r2.trim.gz -o fastqc_trim_dir

module load MultiQC/1.5-foss-2016b-Python-2.7.14

multiqc fastqc_trim_dir
