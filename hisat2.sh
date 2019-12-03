#PBS -S /bin/bash
#PBS -q batch
#PBS -N cufflinks
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1_RNAseq/bowtie/hisat2

module load HISAT2/2.1.0-foss-2016b
#build a histat2 index
hisat2-build GCF_000002035.6_GRCz11_genomic.fna GRCz11_index

#align trimmed reads
hisat2 -f -x GRCz11_index -1 ../n1_R1.trim.gz -2 ../n1_R2.trim.gz -S n1_alignment.sam
hisat2 -f -x GRCz11_index -1 ../n2_R1.trim.gz -2 ../n2_R2.trim.gz -S n2_alignment.sam
hisat2 -f -x GRCz11_index -1 ../n3_R1.trim.gz -2 ../n3_R2.trim.gz -S n3_alignment.sam

hisat2 -f -x GRCz11_index -1 ../wt1_R1.trim.gz -2 ../wt1_R2.trim.gz -S wt1_alignment.sam
hisat2 -f -x GRCz11_index -1 ../wt2_R1.trim.gz -2 ../wt2_R2.trim.gz -S wt2_alignment.sam
hisat2 -f -x GRCz11_index -1 ../wt3_R1.trim.gz -2 ../wt3_R2.trim.gz -S wt2_alignment.sam

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

#cuffdiff analysis (performed on as a highmem job, requiring 600 GB of RAM)
cuffdiff -o cuffdiff -L nsd1MZKO,WT cuffcompare_all_out.combined.gtf \
n1_alignment.sam,n2_alignment.sam,n3_alignment.sam \
wt1_alignment.sam,wt2_alignment.sam,wt3_alignment.sam
