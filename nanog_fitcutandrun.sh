#!/bin/bash
#SBATCH --job-name=nanog_cutandrun_trial1         # Job name
#SBATCH --partition=batch                         # Partition (queue) name
#SBATCH --ntasks=1                                # Run on a single CPU core
#SBATCH --mem=10gb                                # Job memory request
#SBATCH --time=02:00:00                           # Time limit hrs:min:sec
#SBATCH --output=nanog_cutandrun_trial1.%j.out    # Standard output log
#SBATCH --error=nanog_cutandrun_trial1.%j.err     # Standard error log

#SBATCH --mail-type=ALL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=aec16885@uga.edu  # Where to send mail

cd $SLURM_SUBMIT_DIR
cd /scratch/aec16885/nanog/fitCUTandRUN

#trim reads
module load Trim_Galore/0.6.5-GCCcore-8.3.0-Java-11-Python-3.7.4

trim_galore -q 20 --paired replicate1/CRR278533_f1.fastq.gz  replicate1/CRR278533_r2.fastq.gz
trim_galore -q 20 --paired replicate2/CRR278534_f1.fastq.gz  replicate2/CRR278534_r2.fastq.gz
trim_galore -q 20 --paired replicate3/CRR278535_f1.fastq.gz  replicate3/CRR278535_r2.fastq.gz

module load Bowtie2/2.4.5-GCC-10.2.0

bowtie2-build -f work/mglab/anh/reference_genome/main_sat1_sequence_1992.fasta sat1_index

bowtie2 -x sat1_index -1 CRR278533_f1* -2 CRR278533_r2* -U sample1_unpaired --interleaved sample1_interleaved -b sample1 -S sample1_aligned
bowtie2 -x sat1_index -1 CRR278534_f1* -2 CRR278534_r2* -U sample2_unpaired --interleaved sample2_interleaved -b sample2 -S sample2_aligned
bowtie2 -x sat1_index -1 CRR278535_f1* -2 CRR278535_r2* -U sample3_unpaired --interleaved sample3_interleaved -b sample3 -S sample3_aligned
