#PBS -S /bin/bash
#PBS -q batch
#PBS -N morc3_24hpf_rnaseq
#PBS -l nodes=1:ppn=48
#PBS -l walltime=72:00:00
#PBS -l mem=20gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/morc3/RNA_seq/

#trim reads
module load Trim_Galore/0.6.5-GCCcore-8.2.0-Java-11

trim_galore -q 20 --paired morc3ab-24hpf-1_R1_001.fastq.gz morc3ab-24hpf-1_R2_001.fastq.gz
trim_galore -q 20 --paired morc3ab-24hpf-2_R1_001.fastq.gz morc3ab-24hpf-2_R2_001.fastq.gz
trim_galore -q 20 --paired morc3ab-24hpf-3_R1_001.fastq.gz morc3ab-24hpf-3_R2_001.fastq.gz

trim_galore -q 20 --paired morc3b-24hpf-1_R1_001.fastq.gz morc3b-24hpf-1_R2_001.fastq.gz
trim_galore -q 20 --paired morc3b-24hpf-2_R1_001.fastq.gz morc3b-24hpf-2_R2_001.fastq.gz
trim_galore -q 20 --paired morc3b-24hpf-3_R1_001.fastq.gz morc3b-24hpf-3_R2_001.fastq.gz

#trim_galore -q 20 --paired rawfiles/wt-24hpf-1_R1_001.fastq.gz rawfiles/wt-24hpf-1_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/wt-24hpf-2_R1_001.fastq.gz rawfiles/wt-24hpf-2_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/wt-24hpf-3_R1_001.fastq.gz rawfiles/wt-24hpf-3_R2_001.fastq.gz

#wget "https://hgdownload.soe.ucsc.edu/goldenPath/danRer11/bigZips/danRer11.fa.gz"
#wget "https://hgdownload.soe.ucsc.edu/goldenPath/danRer11/bigZips/genes/danRer11.ncbiRefSeq.gtf.gz"
#gunzip danRer11.fa.gz
#gunzip danRer11.ncbiRefSeq.gtf.gz

module load STAR/2.7.1a-foss-2016b

#STAR --runThreadN 48 --runMode genomeGenerate --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --genomeFastaFiles /scratch/aec16885/morc3/RNA_seq/danRer11.fa --sjdbGTFfile /scratch/aec16885/morc3/RNA_seq/danRer11.ncbiRefSeq.gtf --sjdbOverhang 100
gunzip *.fq.gz

STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3ab-24hpf-1_R1_001_val_1.fq /scratch/aec16885/morc3/RNA_seq/morc3ab-24hpf-1_R2_001_val_2.fq --outFileNamePrefix morc3ab_24hpf_1_ --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3ab-24hpf-2_R1_001_val_1.fq /scratch/aec16885/morc3/RNA_seq/morc3ab-24hpf-2_R2_001_val_2.fq --outFileNamePrefix morc3ab_24hpf_2_ --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3ab-24hpf-3_R1_001_val_1.fq /scratch/aec16885/morc3/RNA_seq/morc3ab-24hpf-3_R2_001_val_2.fq --outFileNamePrefix morc3ab_24hpf_3_ --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3b-24hpf-1_R1_001_val_1.fq /scratch/aec16885/morc3/RNA_seq/morc3b-24hpf-1_R2_001_val_2.fq --outFileNamePrefix morc3b_24hpf_1_ --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3b-24hpf-2_R1_001_val_1.fq /scratch/aec16885/morc3/RNA_seq/morc3b-24hpf-2_R2_001_val_2.fq --outFileNamePrefix morc3b_24hpf_2_ --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/morc3b-24hpf-3_R1_001_val_1.fq /scratch/aec16885/morc3/RNA_seq/morc3b-24hpf-3_R2_001_val_2.fq --outFileNamePrefix morc3b_24hpf_3_ --outSAMtype BAM SortedByCoordinate

#STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/wt-24hpf-1_R1_001_val_1.fq /scratch/aec16885/morc3/RNA_seq/wt-24hpf-1_R2_001_val_2.fq --outFileNamePrefix wt_24hpf_1_ --outSAMtype BAM SortedByCoordinate
#STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/wt-24hpf-2_R1_001_val_1.fq /scratch/aec16885/morc3/RNA_seq/wt-24hpf-2_R2_001_val_2.fq --outFileNamePrefix wt_24hpf_2_ --outSAMtype BAM SortedByCoordinate
#STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn /scratch/aec16885/morc3/RNA_seq/wt-24hpf-3_R1_001_val_1.fq /scratch/aec16885/morc3/RNA_seq/wt-24hpf-3_R2_001_val_2.fq --outFileNamePrefix wt_24hpf_3_ --outSAMtype BAM SortedByCoordinate

module load Subread/1.6.2
featureCounts -p -B -O -g gene_id -a danRer11.ncbiRefSeq.gtf -o morc3_24hpf_counts.txt morc3ab_24hpf_1_Aligned.sortedByCoord.out.bam morc3ab_24hpf_2_Aligned.sortedByCoord.out.bam morc3ab_24hpf_3_Aligned.sortedByCoord.out.bam morc3b_24hpf_1_Aligned.sortedByCoord.out.bam morc3b_24hpf_2_Aligned.sortedByCoord.out.bam morc3b_24hpf_3_Aligned.sortedByCoord.out.bam wt_24hpf_1_Aligned.sortedByCoord.out.bam wt_24hpf_2_Aligned.sortedByCoord.out.bam wt_24hpf_3_Aligned.sortedByCoord.out.bam
