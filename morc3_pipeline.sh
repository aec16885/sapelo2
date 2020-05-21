#PBS -S /bin/bash
#PBS -q batch
#PBS -N morc3_6hpf_rnaseq
#PBS -l nodes=1:ppn=20
#PBS -l walltime=72:00:00
#PBS -l mem=20gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/morc3/RNA_seq/

#trim reads
#module load Trim_Galore/0.6.5-GCCcore-8.2.0-Java-11

#trim_galore -q 20 --paired rawfiles/morc3ab-6hpf-1_R1_001.fastq.gz rawfiles/morc3ab-6hpf-1_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/morc3ab-6hpf-2_R1_001.fastq.gz rawfiles/morc3ab-6hpf-2_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/morc3ab-6hpf-3_R1_001.fastq.gz rawfiles/morc3ab-6hpf-3_R2_001.fastq.gz

#trim_galore -q 20 --paired rawfiles/morc3b-6hpf-1_R1_001.fastq.gz rawfiles/morc3b-6hpf-1_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/morc3b-6hpf-2_R1_001.fastq.gz rawfiles/morc3b-6hpf-2_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/morc3b-6hpf-3_R1_001.fastq.gz rawfiles/morc3b-6hpf-3_R2_001.fastq.gz

#trim_galore -q 20 --paired rawfiles/wt-6hpf-1_R1_001.fastq.gz rawfiles/wt-6hpf-1_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/wt-6hpf-2_R1_001.fastq.gz rawfiles/wt-6hpf-2_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/wt-6hpf-3_R1_001.fastq.gz rawfiles/wt-6hpf-3_R2_001.fastq.gz

#wget "https://hgdownload.soe.ucsc.edu/goldenPath/danRer11/bigZips/danRer11.fa.gz"
#wget "https://hgdownload.soe.ucsc.edu/goldenPath/danRer11/bigZips/genes/danRer11.ncbiRefSeq.gtf.gz"
gunzip danRer11.fa.gz
gunzip danRer11.ncbiRefSeq.gtf.gz

module load STAR/2.7.1a-foss-2016b

STAR --runThreadN 20 --runMode genomeGenerate --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --genomeFastaFiles /scratch/aec16885/morc3/RNA_seq/danRer11.fa --sjdbGTFfile /scratch/aec16885/morc3/RNA_seq/danRer11.ncbiRefSeq.gtf --sjdbOverhang 100

STAR --runThreadN 20 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3ab-6hpf-1_R1_001_val_1.fq.gz /scratch/aec16885/morc3/RNA_seq/morc3ab-6hpf-1_R2_001_val_2.fq.gz --outFileNamePrefix morc3ab_6hpf_1_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 20 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3ab-6hpf-2_R1_001_val_1.fq.gz /scratch/aec16885/morc3/RNA_seq/morc3ab-6hpf-2_R2_001_val_2.fq.gz --outFileNamePrefix morc3ab_6hpf_2_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 20 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3ab-6hpf-3_R1_001_val_1.fq.gz /scratch/aec16885/morc3/RNA_seq/morc3ab-6hpf-3_R2_001_val_2.fq.gz --outFileNamePrefix morc3ab_6hpf_3_alignment --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 20 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3b-6hpf-1_R1_001_val_1.fq.gz /scratch/aec16885/morc3/RNA_seq/morc3b-6hpf-1_R2_001_val_2.fq.gz --outFileNamePrefix morc3b_6hpf_1_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 20 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3b-6hpf-2_R1_001_val_1.fq.gz /scratch/aec16885/morc3/RNA_seq/morc3b-6hpf-2_R2_001_val_2.fq.gz --outFileNamePrefix morc3b_6hpf_2_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 20 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3b-6hpf-3_R1_001_val_1.fq.gz /scratch/aec16885/morc3/RNA_seq/morc3b-6hpf-3_R2_001_val_2.fq.gz --outFileNamePrefix morc3b_6hpf_3_alignment --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 20 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/wt-6hpf-1_R1_001_val_1.fq.gz /scratch/aec16885/morc3/RNA_seq/wt-6hpf-1_R2_001_val_2.fq.gz --outFileNamePrefix wt_6hpf_1_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 20 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/wt-6hpf-2_R1_001_val_1.fq.gz /scratch/aec16885/morc3/RNA_seq/wt-6hpf-2_R2_001_val_2.fq.gz --outFileNamePrefix wt_6hpf_2_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 20 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/wt-6hpf-3_R1_001_val_1.fq.gz /scratch/aec16885/morc3/RNA_seq/wt-6hpf-3_R2_001_val_2.fq.gz --outFileNamePrefix wt_6hpf_3_alignment --outSAMtype BAM SortedByCoordinate

module load Subread/1.6.2
featureCounts -p -B -O -g gene_id -a Danio_rerio.GRCz11.98.gtf -o morc3_6hpf_counts.txt morc3ab_6hpf_1_alignment.bam morc3ab_6hpf_2_alignment.bam morc3ab_6hpf_3_alignment.bam morc3b_6hpf_1_alignment.bam morc3b_6hpf_2_alignment.bam morc3b_6hpf_3_alignment.bam wt_6hpf_1_alignment.bam wt_6hpf_2_alignment.bam wt_6hpf_3_alignment.bam
