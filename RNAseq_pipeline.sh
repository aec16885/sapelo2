#PBS -S /bin/bash
#PBS -q batch
#PBS -N kallisto
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=48:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1_RNAseq/bowtie

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

#get reference transcripts
wget "ftp://ftp.ensembl.org/pub/release-98/fasta/danio_rerio/cds/Danio_rerio.GRCz11.cds.all.fa.gz"
#build kallisto index
module load kallisto/0.43.1-foss-2016b
kallisto index -i transcripts.idx Danio_rerio.GRCz11.cds.all.fa.gz
#perform kallisto alignment
kallisto quant -i transcripts.idx -o kallisto/nsd1mzko_1.output -b 100 n1_R1.trim.gz n1_R2.trim.gz
kallisto quant -i transcripts.idx -o kallisto/nsd1mzko_2.output -b 100 n2_R1.trim.gz n2_R2.trim.gz
kallisto quant -i transcripts.idx -o kallisto/nsd1mzko_3.output -b 100 n3_R1.trim.gz n3_R2.trim.gz

kallisto quant -i transcripts.idx -o kallisto/ab_1.output -b 100 wt1_R1.trim.gz wt1_R2.trim.gz
kallisto quant -i transcripts.idx -o kallisto/ab_2.output -b 100 wt2_R1.trim.gz wt2_R2.trim.gz
kallisto quant -i transcripts.idx -o kallisto/ab_3.output -b 100 wt3_R1.trim.gz wt3_R2.trim.gz
#perform sleuth analysis
module load R/3.4.4-foss-2016b-X11-20160819-GACRC
R --no-save < /home/aec16885/sapelo2/volcanoplot.r
