#PBS -S /bin/bash
#PBS -q batch
#PBS -N nsd1_5dpf_RNAseq
#PBS -l nodes=1:ppn=48
#PBS -l walltime=12:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1/traditional_alignment
gunzip *.fq.gz

cd star_seq

module load STAR/2.7.1a-foss-2016b

#STAR --runThreadN 48 --runMode genomeGenerate --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --genomeFastaFiles /scratch/aec16885/morc3/RNA_seq/danRer11.fa --sjdbGTFfile /scratch/aec16885/morc3/RNA_seq/danRer11.ncbiRefSeq.gtf --sjdbOverhang 100

STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn ../Nsd1a_bdouble-1_IGO_07846_22_S31_R1_001_val_1.fq ../Nsd1a_bdouble-1_IGO_07846_22_S31_R2_001_val_2.fq --outFileNamePrefix nsd1_1_ --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn ../Nsd1a_bdouble-2_IGO_07846_23_S32_R1_001_val_1.fq ../Nsd1a_bdouble-2_IGO_07846_23_S32_R2_001_val_2.fq --outFileNamePrefix nsd1_2_ --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn ../Nsd1a_bdouble-3_IGO_07846_24_S33_R1_001_val_1.fq ../Nsd1a_bdouble-3_IGO_07846_24_S33_R2_001_val_2.fq --outFileNamePrefix nsd1_3_ --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn ../Wt5dpf-1_IGO_07846_19_S28_R1_001_val_1.fq ../Wt5dpf-1_IGO_07846_19_S28_R2_001_val_2.fq --outFileNamePrefix ab_1_ --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn ../Wt5ddf-3_IGO_07846_21_S30_R1_001_val_1.fq ../Wt5ddf-3_IGO_07846_21_S30_R2_001_val_2.fq --outFileNamePrefix ab_3_ --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 48 --genomeDir /scratch/aec16885/morc3/RNA_seq/danRer11_index --readFilesIn ../Wt5ddf-2_IGO_07846_20_S29_R1_001_val_1.fq ../Wt5ddf-2_IGO_07846_20_S29_R2_001_val_2.fq --outFileNamePrefix ab_2_ --outSAMtype BAM SortedByCoordinate


module load Subread/1.6.2

featureCounts -p -B -O -g gene_id -a /scratch/aec16885/morc3/RNA_seq/danRer11.ncbiRefSeq.gtf -o nsd1_counts.txt nsd1_1_Aligned.sortedByCoord.out.bam nsd1_2_Aligned.sortedByCoord.out.bam nsd1_3_Aligned.sortedByCoord.out.bam ab_1_Aligned.sortedByCoord.out.bam ab_2_Aligned.sortedByCoord.out.bam ab_3_Aligned.sortedByCoord.out.bam


module load SAMtools/1.10-GCC-8.2.0-2.31.1

samtools index nsd1_1_Aligned.sortedByCoord.out.bam
samtools index nsd1_2_Aligned.sortedByCoord.out.bam
samtools index nsd1_3_Aligned.sortedByCoord.out.bam

samtools index ab_1_Aligned.sortedByCoord.out.bam
samtools index ab_2_Aligned.sortedByCoord.out.bam
samtools index ab_3_Aligned.sortedByCoord.out.bam

module load deepTools/3.3.1-intel-2019b-Python-3.7.4

bamCoverage -bs 10 -p max -b nsd1_1_Aligned.sortedByCoord.out.bam -o nsd1_1.bw
bamCoverage -bs 10 -p max -b nsd1_2_Aligned.sortedByCoord.out.bam -o nsd1_2.bw
bamCoverage -bs 10 -p max -b nsd1_3_Aligned.sortedByCoord.out.bam -o nsd1_3.bw

bamCoverage -bs 10 -p max -b ab_1_Aligned.sortedByCoord.out.bam -o ab_1.bw
bamCoverage -bs 10 -p max -b ab_2_Aligned.sortedByCoord.out.bam -o ab_2.bw
bamCoverage -bs 10 -p max -b ab_3_Aligned.sortedByCoord.out.bam -o ab_3.bw
