#PBS -S /bin/bash
#PBS -q batch
#PBS -N fastp
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=12:00:00
#PBS -l mem=8gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/morc3/

module load FastQC/0.11.8-Java-1.8.0_144
fastp -i rawfiles/s1.fastq.gz -o trimmedfiles/s1_trimmed.fq.gz --failed_out s1_failed.fq.gz -h s1
fastp -i rawfiles/s2.fastq.gz -o trimmedfiles/s2_trimmed.fq.gz --failed_out s2_failed.fq.gz -h s2
fastp -i rawfiles/s3.fastq.gz -o trimmedfiles/s3_trimmed.fq.gz --failed_out s3_failed.fq.gz -h s3
fastp -i rawfiles/s4.fastq.gz -o trimmedfiles/s4_trimmed.fq.gz --failed_out s4_failed.fq.gz -h s4
fastp -i rawfiles/s5.fastq.gz -o trimmedfiles/s5_trimmed.fq.gz --failed_out s5_failed.fq.gz -h s5
fastp -i rawfiles/s6.fastq.gz -o trimmedfiles/s6_trimmed.fq.gz --failed_out s6_failed.fq.gz -h s6

module load MultiQC/1.5-foss-2016b-Python-2.7.14

multiqc fastqc_trim_dir
