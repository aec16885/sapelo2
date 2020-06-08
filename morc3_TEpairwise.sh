#PBS -S /bin/bash
#PBS -q batch
#PBS -N morc3_6hpf_rnaseq
#PBS -l nodes=1:ppn=48
#PBS -l walltime=72:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/morc3/RNA_seq/

module load Subread/1.6.2
featureCounts -p -B -O -g gene_id -a danRer11.repeatmsk.gtf -o morc3ab_6vs24hpf_counts.txt morc3ab_6hpf_1_Aligned.sortedByCoord.out.bam morc3ab_6hpf_2_Aligned.sortedByCoord.out.bam morc3ab_6hpf_3_Aligned.sortedByCoord.out.bam morc3ab_24hpf_1_Aligned.sortedByCoord.out.bam morc3ab_24hpf_2_Aligned.sortedByCoord.out.bam morc3ab_24hpf_3_Aligned.sortedByCoord.out.bam

featureCounts -p -B -O -g gene_id -a danRer11.repeatmsk.gtf -o morc3b_6vs24hpf_counts.txt morc3b_6hpf_1_Aligned.sortedByCoord.out.bam morc3b_6hpf_2_Aligned.sortedByCoord.out.bam morc3b_6hpf_3_Aligned.sortedByCoord.out.bam morc3b_24hpf_1_Aligned.sortedByCoord.out.bam morc3b_24hpf_2_Aligned.sortedByCoord.out.bam morc3b_24hpf_3_Aligned.sortedByCoord.out.bam

featureCounts -p -B -O -g gene_id -a danRer11.repeatmsk.gtf -o morc3abvsWT_6hpf_counts.txt morc3ab_6hpf_1_Aligned.sortedByCoord.out.bam morc3ab_6hpf_2_Aligned.sortedByCoord.out.bam morc3ab_6hpf_3_Aligned.sortedByCoord.out.bam wt_6hpf_1_Aligned.sortedByCoord.out.bam wt_6hpf_2_Aligned.sortedByCoord.out.bam wt_6hpf_3_Aligned.sortedByCoord.out.bam

featureCounts -p -B -O -g gene_id -a danRer11.repeatmsk.gtf -o morc3bvsWT_6hpf_counts.txt morc3b_6hpf_1_Aligned.sortedByCoord.out.bam morc3b_6hpf_2_Aligned.sortedByCoord.out.bam morc3b_6hpf_3_Aligned.sortedByCoord.out.bam wt_6hpf_1_Aligned.sortedByCoord.out.bam wt_6hpf_2_Aligned.sortedByCoord.out.bam wt_6hpf_3_Aligned.sortedByCoord.out.bam

featureCounts -p -B -O -g gene_id -a danRer11.repeatmsk.gtf -o morc3abvsWT_24hpf_counts.txt morc3ab_24hpf_1_Aligned.sortedByCoord.out.bam morc3ab_24hpf_2_Aligned.sortedByCoord.out.bam morc3ab_24hpf_3_Aligned.sortedByCoord.out.bam wt_24hpf_1_Aligned.sortedByCoord.out.bam wt_24hpf_2_Aligned.sortedByCoord.out.bam wt_24hpf_3_Aligned.sortedByCoord.out.bam

featureCounts -p -B -O -g gene_id -a danRer11.repeatmsk.gtf -o morc3bvsWT_24hpf_counts.txt morc3b_24hpf_1_Aligned.sortedByCoord.out.bam morc3b_24hpf_2_Aligned.sortedByCoord.out.bam morc3b_24hpf_3_Aligned.sortedByCoord.out.bam wt_24hpf_1_Aligned.sortedByCoord.out.bam wt_24hpf_2_Aligned.sortedByCoord.out.bam wt_24hpf_3_Aligned.sortedByCoord.out.bam
