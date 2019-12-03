#PBS -S /bin/bash
#PBS -q batch
#PBS -N testjob
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR

module load FastQC/0.11.8-Java-1.8.0_144

fastp -i Nsd1a_bdouble-1_IGO_07846_22_S31_R1_001.fastq.gz -I Nsd1a_bdouble-1_IGO_07846_22_S31_R2_001.fastq.gz -o n1_r1.fq.gz -O n1-r2.fq.gz
fastp -i Nsd1a_bdouble-2_IGO_07846_22_S31_R1_001.fastq.gz -I Nsd1a_bdouble-2_IGO_07846_22_S31_R2_001.fastq.gz -o n2_r1.fq.gz -O n2-r2.fq.gz
fastp -i Nsd1a_bdouble-3_IGO_07846_22_S31_R1_001.fastq.gz -I Nsd1a_bdouble-3_IGO_07846_22_S31_R2_001.fastq.gz -o n3_r1.fq.gz -O n3-r2.fq.gz

fastp -i Wt5dpf-1_IGO_07846_19_S28_R1_001.fastq.gz -I Wt5dpf-1_IGO_07846_19_S28_R2_001.fastq.gz -o wt1_r1.fq.gz -O wt1_r2.fq.gz
fastp -i Wt5ddf-2_IGO_07846_20_S29_R1_001.fastq.gz -I Wt5ddf-2_IGO_07846_20_S29_R1_001.fastq.gz -o wt2_r1.fq.gz -O wt2_r2.fq.gz
fastp -i Wt5ddf-3_IGO_07846_20_S29_R1_001.fastq.gz -I Wt5ddf-3_IGO_07846_20_S29_R1_001.fastq.gz -o wt3_r1.fq.gz -O wt3_r2.fq.gz
