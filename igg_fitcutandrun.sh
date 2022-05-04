#!/bin/bash
#SBATCH --job-name=nanog_cutandrun_trial1         # Job name
#SBATCH --partition=batch                         # Partition (queue) name
#SBATCH --ntasks=1                                # Run on a single CPU core
#SBATCH --mem=10gb                                # Job memory request
#SBATCH --time=24:00:00                           # Time limit hrs:min:sec
#SBATCH --output=nanog_cutandrun_trial1.%j.out    # Standard output log
#SBATCH --error=nanog_cutandrun_trial1.%j.err     # Standard error log

#SBATCH --mail-type=ALL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=aec16885@uga.edu  # Where to send mail

cd $SLURM_SUBMIT_DIR
cd /scratch/aec16885/igg/type1

#trim reads
module load Trim_Galore/0.6.5-GCCcore-8.3.0-Java-11-Python-3.7.4

trim_galore -q 20 --paired CRR332628_f1.fastq.gz  CRR332628_r2.fastq.gz
trim_galore -q 20 --paired CRR332629_f1.fastq.gz  CRR332629_r2.fastq.gz
trim_galore -q 20 --paired CRR332630_f1.fastq.gz  CRR332630_r2.fastq.gz
trim_galore -q 20 --paired CRR332631_f1.fastq.gz  CRR332631_r2.fastq.gz

gunzip CRR332628_f1_val_1.fq.gz
gunzip CRR332628_r2_val_2.fq.gz
gunzip CRR332629_f1_val_1.fq.gz
gunzip CRR332629_r2_val_2.fq.gz
gunzip CRR332630_f1_val_1.fq.gz
gunzip CRR332630_r2_val_2.fq.gz
gunzip CRR332631_f1_val_1.fq.gz
gunzip CRR332631_r2_val_2.fq.gz

module load Bowtie2/2.4.1-GCC-8.3.0
module load SAMtools/1.14-GCC-8.3.0
mkdir output
bowtie2-build -f /work/mglab/anh/reference_genome/main_sat1_sequence_1992.fasta sat1_index

bowtie2 -q --no-unal --phred33 --local -x sat1_index -1 CRR332628_f1_val_1.fq -2 CRR332628_r2_val_2.fq | samtools view -b > output/igg_sample1.bam
bowtie2 -q --no-unal --phred33 --local -x sat1_index -1 CRR332629_f1_val_1.fq -2 CRR332629_r2_val_2.fq | samtools view -b > output/igg_sample2.bam
bowtie2 -q --no-unal --phred33 --local -x sat1_index -1 CRR332630_f1_val_1.fq -2 CRR332630_r2_val_2.fq | samtools view -b > output/igg_sample3.bam
bowtie2 -q --no-unal --phred33 --local -x sat1_index -1 CRR332631_f1_val_1.fq -2 CRR332631_r2_val_2.fq | samtools view -b > output/igg_sample4.bam
