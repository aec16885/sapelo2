#!/bin/bash
#SBATCH --job-name=nanog_cutandrun_trial1         # Job name
#SBATCH --partition=batch                         # Partition (queue) name
#SBATCH --ntasks=1                                # Run on a single CPU core
#SBATCH --mem=10gb                                # Job memory request
#SBATCH --time=02:00:00                           # Time limit hrs:min:sec
#SBATCH --output=nanog_cutandrun_trial1.%j.out    # Standard output log
#SBATCH --error=nanog_cutandrun_trial1.%j.err     # Standard error log

#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=aec16885@uga.edu  # Where to send mail

cd $SLURM_SUBMIT_DIR
cd /scratch/aec16885/morc3/

module load FastQC/0.11.8-Java-1.8.0_144
fastqc -o before_trim_fastqc s1.fastq.gz s2.fastq.gz s3.fastq.gz s4.fastq.gz s5.fastq.gz s6.fastq.gz

module load MultiQC/1.5-foss-2016b-Python-2.7.14

multiqc before_trim_fastqc
