#PBS -S /bin/bash
#PBS -q batch
#PBS -N bowtie_allignment
#PBS -l nodes=2:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1_RNAseq/bowtie

module load Bowtie2/2.3.4.1-foss-2016b
#build bowtie index
bowtie2-build GCF_000002035.6_GRCz11_genomic.fna GRCz11_index
#align reads
bowtie2 -x GRCz11_index -1 n1_R1.trim.gz -2 n1_R2.trim.gz -S n1_allignment.sam
bowtie2 -x GRCz11_index -1 n2_R1.trim.gz -2 n2_R2.trim.gz -S n2_allignment.sam
bowtie2 -x GRCz11_index -1 n3_R1.trim.gz -2 n3_R2.trim.gz -S n3__allignment.sam
bowtie2 -x GRCz11_index -1 wt1_R1.trim.gz -2 wt1_R2.trim.gz -S wt1_allignment.sam
bowtie2 -x GRCz11_index -1 wt2_R1.trim.gz -2 wt2_R2.trim.gz -S wt2_allignment.sam
bowtie2 -x GRCz11_index -1 wt3_R1.trim.gz -2 wt3_R2.trim.gz -S wt3__allignment.sam
