#PBS -S /bin/bash
#PBS -q batch
#PBS -N volcanoplot
#PBS -l nodes=1:ppn=48:AMD
#PBS -l walltime=48:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR

module load R/3.4.4-foss-2016b-X11-20160819-GACRC
R --no-save < /home/aec16885/sapelo2/volcanoplot.r
