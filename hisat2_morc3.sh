#PBS -S /bin/bash
#PBS -q batch
#PBS -N cufflinks
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/morc3

module load HISAT2/2.1.0-foss-2016b
#build a histat2 index
hisat2-build rawfiles/GCF_000002035.6_GRCz11_genomic.fna GRCz11_index

#align trimmed reads
hisat2 -q -x GRCz11_index -U trimmedfiles/s1_t.fq -S s1_alignment.sam
hisat2 -q -x GRCz11_index -U trimmedfiles/s2_t.fq -S s2_alignment.sam
hisat2 -q -x GRCz11_index -U trimmedfiles/s3_t.fq -S s3_alignment.sam
hisat2 -q -x GRCz11_index -U trimmedfiles/s4_t.fq -S s4_alignment.sam
hisat2 -q -x GRCz11_index -U trimmedfiles/s5_t.fq -S s5_alignment.sam
hisat2 -q -x GRCz11_index -U trimmedfiles/s6_t.fq -S s6_alignment.sam
