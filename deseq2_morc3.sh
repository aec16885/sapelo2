#PBS -S /bin/bash
#PBS -q batch
#PBS -N morc3_pipeline
#PBS -l nodes=1:ppn=48
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/morc3

module load R/3.4.4-foss-2016b-X11-20160819-GACRC

R CMD BATCH program.R

## Load DESeq2, stringr and ggplot2 libraries
> library(DESeq2)
> library(stringr)
> library(ggplot2)

## Read the output from featurecounts. First set the working directory, then read the
## output from featurecounts (morc3_allignment_featurecounts here) and  save the object.
> setwd("/scratch/aec16885/morc3")
> counts=read.csv("morc3_allignment_featurecounts", sep="", head=T, skip=1, row.names = "Geneid")

## Create an object for storing names of samples and condition of the samples
##(genotype1/genotype2)
> colnames(counts)[6:11]
> colnames(counts)[6:11]=str_split_fixed(colnames(counts)[6:11],"\\.",6)[,5]
> colnames(counts)[6:11]
> samples=cbind(colnames(counts)[6:11],str_split_fixed(colnames(counts)[6:11],"_",3)[,2])
> rownames(samples)=samples[,1]
> samples=as.data.frame(samples[,-1])
> colnames(samples)="sample number"

## Check if sample names created match with the column names of featurecounts. both
## should match
> all(rownames(samples) %in% colnames(counts))
