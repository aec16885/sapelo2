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

fastp -i n1_R1.trim.gz -I n1_R2.trim.gz -o n1_r1_trim.fq.gz -O n1-r2_trim.fq.gz
fastp -i n2_R1.trim.gz -I n2_R2.trim.gz -o n2_r1_trim.fq.gz -O n2-r2_trim.fq.gz
fastp -i n3_R1.trim.gz -I n3_R2.trim.gz -o n3_r1_trim.fq.gz -O n3-r2_trim.fq.gz

fastp -i wt1_R1.trim.gz -I wt1_R2.trim.gz -o wt1_r1_trim.fq.gz -O wt1-r2_trim.fq.gz
fastp -i wt2_R1.trim.gz -I wt2_R2.trim.gz -o wt2_r1_trim.fq.gz -O wt2-r2_trim.fq.gz
fastp -i wt3_R1.trim.gz -I wt3_R2.trim.gz -o wt3_r1_trim.fq.gz -O wt3-r2_trim.fq.gz


module load MultiQC/1.5-foss-2016b-Python-2.7.14

multiqc fastqc_trim_dir
