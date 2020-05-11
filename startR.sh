#PBS -S /bin/bash
#PBS -q batch
#PBS -N deseq
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe
cd $PBS_O_WORKDIR
cd /scratch/aec16885/nsd1/sat1_alignment

module load R/3.6.2-foss-2018a-X11-20180131-GACRC
R CMD BATCH program.R 
