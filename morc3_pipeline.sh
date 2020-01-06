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

module load HISAT2/2.1.0-foss-2016b
#build a histat2 index
#hisat2-build rawfiles/GCF_000002035.6_GRCz11_genomic.fna GRCz11_index

#align trimmed reads
hisat2 -q -x GRCz11_index -U trimmedfiles/s1_t.fq -S s1_alignment.sam
hisat2 -q -x GRCz11_index -U trimmedfiles/s2_t.fq -S s2_alignment.sam
hisat2 -q -x GRCz11_index -U trimmedfiles/s3_t.fq -S s3_alignment.sam
hisat2 -q -x GRCz11_index -U trimmedfiles/s4_t.fq -S s4_alignment.sam
hisat2 -q -x GRCz11_index -U trimmedfiles/s5_t.fq -S s5_alignment.sam
hisat2 -q -x GRCz11_index -U trimmedfiles/s6_t.fq -S s6_alignment.sam

module load Subread/1.6.2
featureCounts( s1_alignment.sam s2_alignment.sam s3_alignment.sam s4_alignment.sam s5_alignment.sam s6_alignment.sam,

#annotation
annot.ext=GCA_000002035.4_GRCz11_genomic.gtf,
isGTFAnnotationFile=TRUE,
GTF.featureType="exon",
GTF.attrType="gene_ID",
chrAliases=NULL,

#level of summerization
useMetaFeatures=TRUE,

#overlap between reads and features
allowMultiOverlap=FALSE,
minOverlap=1,
largestOverlap=TRUE,
readextension5=0,
readextension3=0,
read2pos=NULL,

#multi-mapping reads
countMultiMappingReads=FALSE,
fraction=FALSE,

#read filtering
minMQS=0,
splitOnly=FALSE,
nonSplitOnly=FALSE,
primaryOnly=FALSE,
ignoreDup=FALSE,

#strandedness
strandSpecific=0,

#exon-exon junctions
juncCounts=TRUE
genome=danRer11.fa

#specific for paired end reads (morc3 data is not paired end, for furutre use)
isPairedEnd=FALSE,
#requireBothEndsMapped=FALSE,
#checkFragLength=FALSE,
#minFragLength=50,
#maxFragLength=600,
#countChimericFragments=TRUE,
#autosort=TRUE,

# miscellaneous
nthreads=1,
maxMOp=10,
reportReads=TRUE)
> morc3_output_${PBS_JOBID}.log
