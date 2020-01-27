#PBS -S /bin/bash
#PBS -q batch
#PBS -N featureCounts_nsd1
#PBS -l nodes=1:ppn=48
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1

module load Subread/1.6.2

featureCounts -p -B -C -a GCF_000002035.6_GRCz11_genomic.gtf.gz -o nsd1_allignment_featurecounts.txt s1_alignment.sam s2_alignment.sam s3_alignment.sam s4_alignment.sam s5_alignment.sam s6_alignment.sam
