#PBS -S /bin/bash
#PBS -q batch
#PBS -N nsd1_rnaseq
#PBS -l nodes=2:ppn=12:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=20gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1/traditional_alignment

#trim reads
module load Trim_Galore/0.6.5-GCCcore-8.2.0-Java-11

trim_galore -q 20 --paired /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-1_IGO_07846_22_S31_R1_001.fastq.gz /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-1_IGO_07846_22_S31_R2_001.fastq.gz
trim_galore -q 20 --paired /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-2_IGO_07846_23_S32_R1_001.fastq.gz /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-2_IGO_07846_23_S32_R2_001.fastq.gz
trim_galore -q 20 --paired /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-3_IGO_07846_24_S33_R1_001.fastq.gz /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-3_IGO_07846_24_S33_R2_001.fastq.gz

trim_galore -q 20 --paired /home/aec16885/nsd1/5dpf_RNAseq/Wt5dpf-1_IGO_07846_19_S28_R1_001.fastq.gz /home/aec16885/nsd1/5dpf_RNAseq/Wt5dpf-1_IGO_07846_19_S28_R2_001.fastq.gz
trim_galore -q 20 --paired /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-2_IGO_07846_20_S29_R1_001.fastq.gz /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-2_IGO_07846_20_S29_R2_001.fastq.gz
trim_galore -q 20 --paired /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-3_IGO_07846_21_S30_R1_001.fastq.gz /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-3_IGO_07846_21_S30_R2_001.fastq.gz

#scp *val_1.fq.gz fastqc_analysis/.
#scp *val_2.fq.gz fastqc_analysis/.

#check quality of reads
#module load MultiQC/1.5-foss-2016b-Python-2.7.14
#multiqc fastqc_analysis

#align trimmed reads
module load HISAT2/2.1.0-foss-2016b

hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 Nsd1a_bdouble-1_IGO_07846_22_S31_R1_001_val_1.fq.gz -2 Nsd1a_bdouble-1_IGO_07846_22_S31_R2_001_val_2.fq.gz -S n1_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 Nsd1a_bdouble-2_IGO_07846_23_S32_R1_001_val_1.fq.gz -2 Nsd1a_bdouble-2_IGO_07846_23_S32_R2_001_val_2.fq.gz -S n2_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 Nsd1a_bdouble-3_IGO_07846_24_S33_R1_001_val_1.fq.gz -2 Nsd1a_bdouble-3_IGO_07846_24_S33_R2_001_val_2.fq.gz -S n3_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 Wt5dpf-1_IGO_07846_19_S28_R1_001_val_1.fq.gz -2 Wt5dpf-1_IGO_07846_19_S28_R2_001_val_2.fq.gz -S wt1_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 Wt5ddf-2_IGO_07846_20_S29_R1_001_val_1.fq.gz -2 Wt5ddf-2_IGO_07846_20_S29_R2_001_val_2.fq.gz -S wt2_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 Wt5ddf-3_IGO_07846_21_S30_R1_001_val_1.fq.gz -2 Wt5ddf-3_IGO_07846_21_S30_R2_001_val_2.fq.gz -S wt3_alignment.sam

#count aligned reads
module load HTSeq/0.9.1-foss-2016b-Python-2.7.14

htseq-count -r name -s yes -a 10 -t exon -i gene_id -m intersection-nonempty --nonunique=all --secondary-alignments=ingnore -o nsd1_RNAseq.sam n1_alignment.sam n2_alignment.sam n3_alignment.sam wt1_alignment.sam wt2_alignment.sam wt3_alignment.sam Danio_rerio.GRCz11.98.gtf
