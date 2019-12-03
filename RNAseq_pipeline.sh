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

wget "ftp://ftp.ensembl.org/pub/release-98/fasta/danio_rerio/cds/Danio_rerio.GRCz11.cds.all.fa.gz"

module load kallisto/0.43.1-foss-2016b
kallisto index -i transcripts.idx Danio_rerio.GRCz11.cds.all.fa.gz

kallisto quant -i transcripts.idx -o kallisto/nsd1mzko_1.output -b 100 n1_R1.trim.gz n1_R2.trim.gz
kallisto quant -i transcripts.idx -o kallisto/nsd1mzko_2.output -b 100 n2_R1.trim.gz n2_R2.trim.gz
kallisto quant -i transcripts.idx -o kallisto/nsd1mzko_3.output -b 100 n3_R1.trim.gz n3_R2.trim.gz

kallisto quant -i transcripts.idx -o kallisto/ab_1.output -b 100 wt1_R1.trim.gz wt1_R2.trim.gz
kallisto quant -i transcripts.idx -o kallisto/ab_2.output -b 100 wt2_R1.trim.gz wt2_R2.trim.gz
kallisto quant -i transcripts.idx -o kallisto/ab_3.output -b 100 wt3_R1.trim.gz wt3_R2.trim.gz

module load R/3.4.4-foss-2016b-X11-20160819-GACRC
R --no-save < /home/aec16885/nsd1/5dpf_RNAseq/volcanoplot.r
