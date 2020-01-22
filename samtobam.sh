#PBS -S /bin/bash
#PBS -q batch
#PBS -N samtobam
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=10:00:00
#PBS -l mem=8gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe
cd $PBS_O_WORKDIR
#change to directry where files are
cd /scratch/aec16885/morc3

module load SAMtools/1.6-foss-2016b
scp s1_alignment.sam morc3bdel_1.sam
scp s2_alignment.sam morc3bdel_2.sam
scp s3_alignment.sam morc3bdel_3.sam
scp s4_alignment.sam ab_1.sam
scp s5_alignment.sam ab_2.sam
scp s6_alignment.sam ab_3.sam


samtools view -b morc3bdel_1.sam > morc3bdel_1.bam
samtools view -b morc3bdel_2.sam > morc3bdel_2.bam
samtools view -b morc3bdel_3.sam > morc3bdel_3.bam
samtools view -b ab_1.sam > ab_1.bam
samtools view -b ab_2.sam > ab_2.bam
samtools view -b ab_3.sam > ab_3.bam
