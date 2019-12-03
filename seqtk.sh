#PBS -S /bin/bash
#PBS -q batch
#PBS -N seqtk
#PBS -l nodes=2:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR

cd /scratch/aec16885/nsd1_RNAseq/bowtie

module load seqtk/1.2-foss-2016b

seqtk mergepe Nsd1a_bdouble-1_IGO_07846_22_S31_R1_001.fastq.gz Nsd1a_bdouble-1_IGO_07846_22_S31_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > n1_R12.trim
seqtk seq -1 n1_R12.trim | gzip > n1_R1.trim.gz
seqtk seq -2 n1_R12.trim | gzip > n1_R2.trim.gz

seqtk mergepe Nsd1a_bdouble-2_IGO_07846_23_S32_R1_001.fastq.gz Nsd1a_bdouble-2_IGO_07846_23_S32_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > n2_R12.trim
seqtk seq -1 n2_R12.trim | gzip > n2_R1.trim.gz
seqtk seq -2 n2_R12.trim | gzip > n2_R2.trim.gz

seqtk mergepe Nsd1a_bdouble-3_IGO_07846_24_S33_R1_001.fastq.gz Nsd1a_bdouble-3_IGO_07846_24_S33_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > n3_R12.trim
seqtk seq -1 n3_R12.trim | gzip > n3_R1.trim.gz
seqtk seq -2 n3_R12.trim | gzip > n3_R2.trim.gz

seqtk mergepe Wt5dpf-1_IGO_07846_19_S28_R1_001.fastq.gz Wt5dpf-1_IGO_07846_19_S28_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > wt1_R12.trim
seqtk seq -1 wt1_R12.trim | gzip > wt1_R1.trim.gz
seqtk seq -2 wt1_R12.trim | gzip > wt1_R2.trim.gz

seqtk mergepe Wt5ddf-2_IGO_07846_20_S29_R1_001.fastq.gz Wt5ddf-2_IGO_07846_20_S29_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > wt2_R12.trim
seqtk seq -1 wt2_R12.trim | gzip > wt2_R1.trim.gz
seqtk seq -2 wt2_R12.trim | gzip > wt2_R2.trim.gz

seqtk mergepe Wt5ddf-3_IGO_07846_21_S30_R1_001.fastq.gz Wt5ddf-3_IGO_07846_21_S30_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > wt3_R12.trim
seqtk seq -1 wt3_R12.trim | gzip > wt3_R1.trim.gz
seqtk seq -2 wt3_R12.trim | gzip > wt3_R2.trim.gz
