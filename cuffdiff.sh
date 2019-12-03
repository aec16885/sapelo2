#PBS -S /bin/bash
#PBS -q highmem_q
#PBS -N cuffdiff
#PBS -l nodes=1:ppn=12
#PBS -l walltime=48:00:00
#PBS -l mem=600gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1_RNAseq/bowtie/hisat2

module load SAMtools/0.1.19-foss-2016b
module load Cufflinks/2.2.1-foss-2016b

cuffdiff -o cuffdiff -L nsd1MZKO,WT cuffcompare_all_out.combined.gtf \
n1_alignment.sam,n2_alignment.sam,n3_alignment.sam \
wt1_alignment.sam,wt2_alignment.sam,wt3_alignment.sam




