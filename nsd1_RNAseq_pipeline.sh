#PBS -S /bin/bash
#PBS -q batch
#PBS -N hisat2_nsd1
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1/traditional_alignment

#trim reads
module load FastQC/0.11.8-Java-1.8.0_144

fastp -i /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-1_IGO_07846_22_S31_R1_001.fastq.gz -I /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-1_IGO_07846_22_S31_R2_001.fastq.gz -o n1_r1.fq.gz -O n1_r2.fq.gz
fastp -i /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-2_IGO_07846_22_S31_R1_001.fastq.gz -I /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-2_IGO_07846_22_S31_R2_001.fastq.gz -o n2_r1.fq.gz -O n2_r2.fq.gz
fastp -i /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-3_IGO_07846_22_S31_R1_001.fastq.gz -I /home/aec16885/nsd1/5dpf_RNAseq/Nsd1a_bdouble-3_IGO_07846_22_S31_R2_001.fastq.gz -o n3_r1.fq.gz -O n3_r2.fq.gz

fastp -i /home/aec16885/nsd1/5dpf_RNAseq/Wt5dpf-1_IGO_07846_19_S28_R1_001.fastq.gz -I /home/aec16885/nsd1/5dpf_RNAseq/Wt5dpf-1_IGO_07846_19_S28_R2_001.fastq.gz -o wt1_r1.fq.gz -O wt1_r2.fq.gz
fastp -i /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-2_IGO_07846_20_S29_R1_001.fastq.gz -I /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-2_IGO_07846_20_S29_R1_001.fastq.gz -o wt2_r1.fq.gz -O wt2_r2.fq.gz
fastp -i /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-3_IGO_07846_20_S29_R1_001.fastq.gz -I /home/aec16885/nsd1/5dpf_RNAseq/Wt5ddf-3_IGO_07846_20_S29_R1_001.fastq.gz -o wt3_r1.fq.gz -O wt3_r2.fq.gz

#check quality of reads
module load MultiQC/1.5-foss-2016b-Python-2.7.14
multiqc fastqc_analysis

module load HISAT2/2.1.0-foss-2016b

#align trimmed reads
hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 n1_r1.fq.gz -2 n1_r2.fq.gz -S n1_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 n2_r1.fq.gz -2 n2_r2.fq.gz -S n2_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 n3_r1.fq.gz -2 n3_r2.fq.gz -S n3_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 wt1_r1.fq.gz -2 wt1_r2.fq.gz -S wt1_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 wt2_r1.fq.gz -2 wt2_r2.fq.gz -S wt2_alignment.sam
hisat2 -q --no-mixed --no-discordant -x GRCz11_index -1 wt3_r1.fq.gz -2 wt3_r2.fq.gz -S wt3_alignment.sam

#count aligned reads
module load HTSeq/0.9.1-foss-2016b-Python-2.7.14

htseq-count -r name -s yes -a 10 -t exon -i gene_id -m intersection-nonempty --nonunique=all --secondary-alignments=ingnore -o nsd1_RNAseq.sam n1_alignment.sam n2_alignment.sam n3_alignment.sam wt1_alignment.sam wt2_alignment.sam wt3_alignment.sam Danio_rerio.GRCz11.98.gtf
