#PBS -S /bin/bash
#PBS -q batch
#PBS -N fastp
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=24:00:00
#PBS -l mem=8gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/morc3/

module load FastQC/0.11.8-Java-1.8.0_144
fastqc -o before_trim_fastqc s1.fastq.gz s2.fastq.gz s3.fastq.gz s4.fastq.gz s5.fastq.gz s6.fastq.gz

module load MultiQC/1.5-foss-2016b-Python-2.7.14

multiqc before_trim_fastqc
