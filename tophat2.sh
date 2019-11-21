#PBS -S /bin/bash
#PBS -q batch
#PBS -N tophat2_allignment
#PBS -l nodes=2:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1_RNAseq/bowtie

module load TopHat/2.1.1-foss-2016b
module load Bowtie2/2.3.4.1-foss-2016b
module load SAMtools/1.6-foss-2016b

tophat2 -p 2 -G Danio_rerio.GRCz11.98.gtf GRCz11_index n1_R1.trim.gz n1_R2.trim.gz
tophat2 -p 2 -G Danio_rerio.GRCz11.98.gtf GRCz11_index n2_R1.trim.gz n2_R2.trim.gz
tophat2 -p 2 -G Danio_rerio.GRCz11.98.gtf GRCz11_index n3_R1.trim.gz n3_R2.trim.gz

tophat2 -p 2 -G Danio_rerio.GRCz11.98.gtf GRCz11_index wt1_R1.trim.gz wt1_R2.trim.gz
tophat2 -p 2 -G Danio_rerio.GRCz11.98.gtf GRCz11_index wt2_R1.trim.gz wt2_R2.trim.gz
tophat2 -p 2 -G Danio_rerio.GRCz11.98.gtf GRCz11_index wt3_R1.trim.gz wt3_R2.trim.gz
