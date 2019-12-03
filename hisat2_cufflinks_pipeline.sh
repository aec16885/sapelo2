#PBS -S /bin/bash
#PBS -q batch
#PBS -N hisat2_cufflinks_pipeline
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
#change to directry where files are
cd /scratch/aec16885/nsd1_RNAseq/bowtie/hisat2

#test quality of reads before trimming
module load FastQC/0.11.8-Java-1.8.0_144

mkdir fastqc_beforetrim
cd fastqc_beforetrim
fastp -i ../../Nsd1a_bdouble-1_IGO_07846_22_S31_R1_001.fastq.gz -I ../../Nsd1a_bdouble-1_IGO_07846_22_S31_R2_001.fastq.gz -o n1_r1.fq.gz -O n1-r2.fq.gz
fastp -i ../../Nsd1a_bdouble-2_IGO_07846_22_S31_R1_001.fastq.gz -I ../../Nsd1a_bdouble-2_IGO_07846_22_S31_R2_001.fastq.gz -o n2_r1.fq.gz -O n2-r2.fq.gz
fastp -i ../../Nsd1a_bdouble-3_IGO_07846_22_S31_R1_001.fastq.gz -I ../../Nsd1a_bdouble-3_IGO_07846_22_S31_R2_001.fastq.gz -o n3_r1.fq.gz -O n3-r2.fq.gz

fastp -i ../../Wt5dpf-1_IGO_07846_19_S28_R1_001.fastq.gz -I ../../Wt5dpf-1_IGO_07846_19_S28_R2_001.fastq.gz -o wt1_r1.fq.gz -O wt1_r2.fq.gz
fastp -i ../../Wt5ddf-2_IGO_07846_20_S29_R1_001.fastq.gz -I ../../Wt5ddf-2_IGO_07846_20_S29_R1_001.fastq.gz -o wt2_r1.fq.gz -O wt2_r2.fq.gz
fastp -i ../../Wt5ddf-3_IGO_07846_20_S29_R1_001.fastq.gz -I ../../Wt5ddf-3_IGO_07846_20_S29_R1_001.fastq.gz -o wt3_r1.fq.gz -O wt3_r2.fq.gz
cd ..

module load MultiQC/1.5-foss-2016b-Python-2.7.14
multiqc fastqc_beforetrim

#trim reads
module load seqtk/1.2-foss-2016b

seqtk mergepe ../Nsd1a_bdouble-1_IGO_07846_22_S31_R1_001.fastq.gz ../Nsd1a_bdouble-1_IGO_07846_22_S31_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > n1_R12.trim
seqtk seq -1 n1_R12.trim | gzip > n1_R1.trim.gz
seqtk seq -2 n1_R12.trim | gzip > n1_R2.trim.gz

seqtk mergepe ../Nsd1a_bdouble-2_IGO_07846_23_S32_R1_001.fastq.gz ../Nsd1a_bdouble-2_IGO_07846_23_S32_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > n2_R12.trim
seqtk seq -1 n2_R12.trim | gzip > n2_R1.trim.gz
seqtk seq -2 n2_R12.trim | gzip > n2_R2.trim.gz

seqtk mergepe ../Nsd1a_bdouble-3_IGO_07846_24_S33_R1_001.fastq.gz ../Nsd1a_bdouble-3_IGO_07846_24_S33_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > n3_R12.trim
seqtk seq -1 n3_R12.trim | gzip > n3_R1.trim.gz
seqtk seq -2 n3_R12.trim | gzip > n3_R2.trim.gz

seqtk mergepe ../Wt5dpf-1_IGO_07846_19_S28_R1_001.fastq.gz ../Wt5dpf-1_IGO_07846_19_S28_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > wt1_R12.trim
seqtk seq -1 wt1_R12.trim | gzip > wt1_R1.trim.gz
seqtk seq -2 wt1_R12.trim | gzip > wt1_R2.trim.gz

seqtk mergepe ../Wt5ddf-2_IGO_07846_20_S29_R1_001.fastq.gz ../Wt5ddf-2_IGO_07846_20_S29_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > wt2_R12.trim
seqtk seq -1 wt2_R12.trim | gzip > wt2_R1.trim.gz
seqtk seq -2 wt2_R12.trim | gzip > wt2_R2.trim.gz

seqtk mergepe ../Wt5ddf-3_IGO_07846_21_S30_R1_001.fastq.gz ../Wt5ddf-3_IGO_07846_21_S30_R2_001.fastq.gz | seqtk trimfq - | seqtk dropse > wt3_R12.trim
seqtk seq -1 wt3_R12.trim | gzip > wt3_R1.trim.gz
seqtk seq -2 wt3_R12.trim | gzip > wt3_R2.trim.gz

#test quaity after trimming
mkdir fastqc_aftertrim
cd fastqc_aftertrim
module load FastQC/0.11.8-Java-1.8.0_144

fastp -i ../n1_R1.trim.gz -I ../n1_R2.trim.gz -o n1_r1_trim.fq.gz -O n1-r2_trim.fq.gz
fastp -i ../n2_R1.trim.gz -I ../n2_R2.trim.gz -o n2_r1_trim.fq.gz -O n2-r2_trim.fq.gz
fastp -i ../n3_R1.trim.gz -I ../n3_R2.trim.gz -o n3_r1_trim.fq.gz -O n3-r2_trim.fq.gz

fastp -i ../wt1_R1.trim.gz -I ../wt1_R2.trim.gz -o wt1_r1_trim.fq.gz -O wt1-r2_trim.fq.gz
fastp -i ../wt2_R1.trim.gz -I ../wt2_R2.trim.gz -o wt2_r1_trim.fq.gz -O wt2-r2_trim.fq.gz
fastp -i ../wt3_R1.trim.gz -I ../wt3_R2.trim.gz -o wt3_r1_trim.fq.gz -O wt3-r2_trim.fq.gz

cd ..
module load MultiQC/1.5-foss-2016b-Python-2.7.14
multiqc fastqc_aftertrim

#hisat2 analysis

module load HISAT2/2.1.0-foss-2016b
#build a histat2 index
hisat2-build GCF_000002035.6_GRCz11_genomic.fna GRCz11_index

#align trimmed reads
hisat2 -f -x GRCz11_index -1 n1_R1.trim.gz -2 n1_R2.trim.gz -S n1_alignment.sam
hisat2 -f -x GRCz11_index -1 n2_R1.trim.gz -2 n2_R2.trim.gz -S n2_alignment.sam
hisat2 -f -x GRCz11_index -1 n3_R1.trim.gz -2 n3_R2.trim.gz -S n3_alignment.sam

hisat2 -f -x GRCz11_index -1 wt1_R1.trim.gz -2 wt1_R2.trim.gz -S wt1_alignment.sam
hisat2 -f -x GRCz11_index -1 wt2_R1.trim.gz -2 wt2_R2.trim.gz -S wt2_alignment.sam
hisat2 -f -x GRCz11_index -1 wt3_R1.trim.gz -2 wt3_R2.trim.gz -S wt2_alignment.sam

#convert files into sorted bam for cufflinks analysis
module load SAMtools/1.6-foss-2016b

samtools view -b n1_alignment.sam > n1_alignment.bam
samtools view -b n2_alignment.sam > n2_alignment.bam
samtools view -b n3_alignment.sam > n3_alignment.bam

samtools view -b wt1_alignment.sam > wt1_alignment.bam
samtools view -b wt2_alignment.sam > wt2_alignment.bam
samtools view -b wt3_alignment.sam > wt3_alignment.bam

samtools sort -O SAM n1_alignment.bam > n1_alignment.sorted.sam
samtools sort -O SAM n2_alignment.bam > n2_alignment.sorted.sam
samtools sort -O SAM n3_alignment.bam > n3_alignment.sorted.sam

samtools sort -O SAM wt1_alignment.bam > wt1_alignment.sorted.sam
samtools sort -O SAM wt2_alignment.bam > wt2_alignment.sorted.sam
samtools sort -O SAM wt3_alignment.bam > wt3_alignment.sorted.sam

samtools view -b n1_alignment.sorted.sam > n1_alignment.sorted.bam
samtools view -b n2_alignment.sorted.sam > n2_alignment.sorted.bam
samtools view -b n3_alignment.sorted.sam > n3_alignment.sorted.bam

samtools view -b wt1_alignment.sorted.sam > wt1_alignment.sorted.bam
samtools view -b wt2_alignment.sorted.sam > wt2_alignment.sorted.bam
samtools view -b wt3_alignment.sorted.sam > wt3_alignment.sorted.bam

#analyze reads with cufflinks
module load SAMtools/0.1.19-foss-2016b
module load Cufflinks/2.2.1-foss-2016b

mkdir cufflinks_output_n1
mkdir cufflinks_output_n2
mkdir cufflinks_output_n3
mkdir cufflinks_output_wt1
mkdir cufflinks_output_wt2
mkdir cufflinks_output_wt3

cufflinks -o cufflinks_output_n1/ -g Danio_rerio.GRCz11.98.gtf n1_alignment.sorted.bam
cufflinks -o cufflinks_output_n2/ -g Danio_rerio.GRCz11.98.gtf n2_alignment.sorted.bam
cufflinks -o cufflinks_output_n3/ -g Danio_rerio.GRCz11.98.gtf n3_alignment.sorted.bam

cufflinks -o cufflinks_output_wt1/ -g Danio_rerio.GRCz11.98.gtf wt1_alignment.sorted.bam
cufflinks -o cufflinks_output_wt2/ -g Danio_rerio.GRCz11.98.gtf wt2_alignment.sorted.bam
cufflinks -o cufflinks_output_wt3/ -g Danio_rerio.GRCz11.98.gtf wt3_alignment.sorted.bam

#compare cufflink analysis to eachother, with all, just nsd1MZKO samples, and just wildtype samples
cuffcompare -o cuffcompare_all_out Danio_rerio.GRCz11.98.gtf cufflinks_output_n1/transcripts.gtf cufflinks_output_n2/transcripts.gtf cufflinks_output_n3/transcripts.gtf cufflinks_output_wt1/transcripts.gtf cufflinks_output_wt2/transcripts.gtf cufflinks_output_wt3/transcripts.gtf
cuffcompare -o cuffcompare_nsd1_out Danio_rerio.GRCz11.98.gtf cufflinks_output_n1/transcripts.gtf cufflinks_output_n2/transcripts.gtf cufflinks_output_n3/transcripts.gtf
cuffcompare -o cuffcompare_wt_out Danio_rerio.GRCz11.98.gtf  cufflinks_output_wt1/transcripts.gtf cufflinks_output_wt2/transcripts.gtf cufflinks_output_wt3/transcripts.gtf

#merge all cufflink analysis to one .gtf for cuffdiff analysis
cuffmerge -g Danio_rerio.GRCz11.98.gtf cuffmerge.txt

qsub cuffdiff.sh
