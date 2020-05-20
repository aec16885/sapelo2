#PBS -S /bin/bash
#PBS -q batch
#PBS -N morc3ab_rnaseq
#PBS -l nodes=1:ppn=48
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/morc3/RNA_seq/

#trim reads
module load Trim_Galore/0.6.5-GCCcore-8.2.0-Java-11

#trim_galore -q 20 --paired rawfiles/morc3ab-6hpf-1_R1_001.fastq.gz rawfiles/morc3ab-6hpf-1_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/morc3ab-6hpf-2_R1_001.fastq.gz rawfiles/morc3ab-6hpf-2_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/morc3ab-6hpf-3_R1_001.fastq.gz rawfiles/morc3ab-6hpf-3_R2_001.fastq.gz

trim_galore -q 20 --paired rawfiles/morc3b-6hpf-1_R1_001.fastq.gz rawfiles/morc3b-6hpf-1_R2_001.fastq.gz
trim_galore -q 20 --paired rawfiles/morc3b-6hpf-2_R1_001.fastq.gz rawfiles/morc3b-6hpf-2_R2_001.fastq.gz
trim_galore -q 20 --paired rawfiles/morc3b-6hpf-3_R1_001.fastq.gz rawfiles/morc3b-6hpf-3_R2_001.fastq.gz

#trim_galore -q 20 --paired rawfiles/wt-6hpf-1_R1_001.fastq.gz rawfiles/wt-6hpf-1_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/wt-6hpf-2_R1_001.fastq.gz rawfiles/wt-6hpf-2_R2_001.fastq.gz
#trim_galore -q 20 --paired rawfiles/wt-6hpf-3_R1_001.fastq.gz rawfiles/wt-6hpf-3_R2_001.fastq.gz

ml STAR/2.7.1a-foss-2016b
STAR --runThreadN 4 --runMode genomeGenerate --genomeDir danRer11_index --genomeFastaFiles danRer11.fa --sjdbGTFfile ../../nsd1/Danio_rerio.GRCz11.98.gtf --sjdbOverhang 100

STAR --runThreadN 4 --genomeDir danRer11_index --readFilesIn morc3ab-6hpf-1_R1_001_val_1.fq.gz morc3ab-6hpf-1_R2_001_val_2.fq.gz --outFileNamePrefix morc3ab_6hpf_1_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 4 --genomeDir danRer11_index --readFilesIn morc3ab-6hpf-2_R1_001_val_1.fq.gz morc3ab-6hpf-2_R2_001_val_2.fq.gz --outFileNamePrefix morc3ab_6hpf_2_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 4 --genomeDir danRer11_index --readFilesIn morc3ab-6hpf-3_R1_001_val_1.fq.gz morc3ab-6hpf-3_R2_001_val_2.fq.gz --outFileNamePrefix morc3ab_6hpf_3_alignment --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 4 --genomeDir danRer11_index --readFilesIn morc3b-6hpf-1_R1_001_val_1.fq.gz morc3b-6hpf-1_R2_001_val_2.fq.gz --outFileNamePrefix morc3b_6hpf_1_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 4 --genomeDir danRer11_index --readFilesIn morc3b-6hpf-2_R1_001_val_1.fq.gz morc3b-6hpf-2_R2_001_val_2.fq.gz --outFileNamePrefix morc3b_6hpf_2_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 4 --genomeDir danRer11_index --readFilesIn morc3b-6hpf-3_R1_001_val_1.fq.gz morc3b-6hpf-3_R2_001_val_2.fq.gz --outFileNamePrefix morc3b_6hpf_3_alignment --outSAMtype BAM SortedByCoordinate

STAR --runThreadN 4 --genomeDir danRer11_index --readFilesIn wt-6hpf-1_R1_001_val_1.fq.gz wt-6hpf-1_R2_001_val_2.fq.gz --outFileNamePrefix wt_6hpf_1_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 4 --genomeDir danRer11_index --readFilesIn wt-6hpf-2_R1_001_val_1.fq.gz wt-6hpf-2_R2_001_val_2.fq.gz --outFileNamePrefix wt_6hpf_2_alignment --outSAMtype BAM SortedByCoordinate
STAR --runThreadN 4 --genomeDir danRer11_index --readFilesIn wt-6hpf-3_R1_001_val_1.fq.gz wt-6hpf-3_R2_001_val_2.fq.gz --outFileNamePrefix wt_6hpf_3_alignment --outSAMtype BAM SortedByCoordinate

module load Subread/1.6.2
featureCounts -p -B -O -g gene_id -a Danio_rerio.GRCz11.98.gtf -o morc3_6hpf_counts.txt morc3ab_6hpf_1_alignment.bam morc3ab_6hpf_2_alignment.bam morc3ab_6hpf_3_alignment.bam morc3b_6hpf_1_alignment.bam morc3b_6hpf_2_alignment.bam morc3b_6hpf_3_alignment.bam wt_6hpf_1_alignment.bam wt_6hpf_2_alignment.bam wt_6hpf_3_alignment.bam
