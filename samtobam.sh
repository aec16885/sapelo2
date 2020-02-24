#PBS -S /bin/bash
#PBS -q batch
#PBS -N samtobam
#PBS -l nodes=1:ppn=12
#PBS -l walltime=2:00:00
#PBS -l mem=8gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe
cd $PBS_O_WORKDIR
#change to directry where files are
cd /scratch/aec16885/nsd1

module load SAMtools/1.6-foss-2016b
scp n1_alignment.sam n1.sam
scp n2_alignment.sam n2.sam
scp n3_alignment.sam n3.sam
scp wt1_alignment.sam ab_1.sam
scp wt2_alignment.sam ab_2.sam
scp wt3_alignment.sam ab_3.sam


samtools view -S -b n1_alignment.sam > n1.bam
samtools view -S -b n2_alignment.sam > n2.bam
samtools view -S -b n3_alignment.sam > n2.bam
samtools view -S -b wt1_alignment.sam > ab_1.bam
samtools view -S -b wt2_alignment.sam > ab_2.bam
samtools view -S -b wt3_alignment.sam > ab_3.bam
