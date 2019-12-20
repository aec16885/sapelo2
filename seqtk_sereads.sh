#PBS -S /bin/bash
#PBS -q batch
#PBS -N seqtk
#PBS -l nodes=2:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR

cd /scratch/aec16885/morc3

module load seqtk/1.2-foss-2016b

seqtk trimfq rawfiles/s1.fastq.gz > trimmedfiles/s1_trimmed.fq.gz
seqtk trimfq rawfiles/s2.fastq.gz > trimmedfiles/s2_trimmed.fq.gz
seqtk trimfq rawfiles/s3.fastq.gz > trimmedfiles/s3_trimmed.fq.gz
seqtk trimfq rawfiles/s4.fastq.gz > trimmedfiles/s4_trimmed.fq.gz
seqtk trimfq rawfiles/s5.fastq.gz > trimmedfiles/s5_trimmed.fq.gz
seqtk trimfq rawfiles/s6.fastq.gz > trimmedfiles/s6_trimmed.fq.gz
