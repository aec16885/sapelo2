#PBS -S /bin/bash
#PBS -q batch
#PBS -N featureCounts
#PBS -l nodes=1:ppn=1
#PBS -l walltime=10:00:00
#PBS -l mem=2gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/morc3

module load Subread/1.6.2

featureCounts -F 'gff' -a GCA_000002035.4_GRCz11_genomic.gff -o morc3_allignment_featurecounts s1_alignment.sam s2_alignment.sam s3_alignment.sam s4_alignment.sam s5_alignment.sam s6_alignment.sam

#annotation
#annot.ext=GCA_000002035.4_GRCz11_genomic.gtf,
#isGTFAnnotationFile=TRUE,
#GTF.featureType="exon",
#GTF.attrType="gene_ID",
#chrAliases=NULL,

#level of summerization
#useMetaFeatures=TRUE,

#overlap between reads and features
#allowMultiOverlap=FALSE,
#minOverlap=1,
#largestOverlap=TRUE,
#readextension5=0,
#readextension3=0,
#read2pos=NULL,

#multi-mapping reads
#countMultiMappingReads=FALSE,
#fraction=FALSE,

#read filtering
#minMQS=0,
#splitOnly=FALSE,
#nonSplitOnly=FALSE,
#primaryOnly=FALSE,
#ignoreDup=FALSE,

#strandedness
#strandSpecific=0,

#exon-exon junctions
#juncCounts=TRUE,
#genome=danRer11.fa,

#specific for paired end reads (morc3 data is not paired end, for furutre use)
#isPairedEnd=FALSE,
#requireBothEndsMapped=FALSE,
#checkFragLength=FALSE,
#minFragLength=50,
#maxFragLength=600,
#countChimericFragments=TRUE,
#autosort=TRUE,

# miscellaneous
#nthreads=1,
#maxMOp=10,
#reportReads=TRUE,
