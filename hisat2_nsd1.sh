#PBS -S /bin/bash
#PBS -q batch
#PBS -N hisat2_nsd1
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1

module load HISAT2/2.1.0-foss-2016b
#build a histat2 index
hisat2-build ../sat1_mzt/GRCz11_sat1.fa GRCz11_index_sat1

#align trimmed reads
hisat2 -q --no-mixed --no-discordant -x GRCz11_index_sat1 -1 /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-1_IGO_07846_22_S31_R1_001.fastq.gz -2 /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-1_IGO_07846_22_S31_R2_001.fastq.gz -S n1_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index_sat1 -1 /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-2_IGO_07846_23_S32_R1_001.fastq.gz -2 /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-2_IGO_07846_23_S32_R2_001.fastq.gz -S n2_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index_sat1 -1 /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-3_IGO_07846_24_S33_R1_001.fastq.gz -2 /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-3_IGO_07846_24_S33_R2_001.fastq.gz -S n3_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index_sat1 -1 /home/aec16885/nsd1/5dpf_RNAseq/Wt5dpf-1_IGO_07846_19_S28_R1_001.fastq.gz -2 /home/aec16885/nsd1/5dpf_RNAseq/Wt5dpf-1_IGO_07846_19_S28_R2_001.fastq.gz -S wt1_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index_sat1 -1 /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-2_IGO_07846_20_S29_R1_001.fastq.gz -2 /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-2_IGO_07846_20_S29_R2_001.fastq.gz -S wt2_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index_sat1 -1 /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-3_IGO_07846_21_S30_R1_001.fastq.gz -2 /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-3_IGO_07846_21_S30_R2_001.fastq.gz -S wt3_alignment.sam
