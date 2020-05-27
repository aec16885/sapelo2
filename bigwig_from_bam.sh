#PBS -S /bin/bash
#PBS -q batch
#PBS -N bighead
#PBS -l nodes=1:ppn=48
#PBS -l walltime=12:00:00
#PBS -l mem=10gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
cd /scratch/aec16885/morc3/RNA_seq/

module load SAMtools/1.10-GCC-8.2.0-2.31.1

samtools index morc3ab_6hpf_1_Aligned.sortedByCoord.out.bam
samtools index morc3ab_6hpf_2_Aligned.sortedByCoord.out.bam
samtools index morc3ab_6hpf_3_Aligned.sortedByCoord.out.bam

samtools index morc3b_6hpf_1_Aligned.sortedByCoord.out.bam
samtools index morc3b_6hpf_2_Aligned.sortedByCoord.out.bam
samtools index morc3b_6hpf_3_Aligned.sortedByCoord.out.bam

samtools index wt_6hpf_1_Aligned.sortedByCoord.out.bam
samtools index wt_6hpf_2_Aligned.sortedByCoord.out.bam
samtools index wt_6hpf_3_Aligned.sortedByCoord.out.bam

module load deepTools/3.3.1-intel-2019b-Python-3.7.4

bamCoverage -bs 10 -p max -b morc3ab_6hpf_1_Aligned.sortedByCoord.out.bam -o morc3ab_6hpf_1.bw
bamCoverage -bs 10 -p max -b morc3ab_6hpf_2_Aligned.sortedByCoord.out.bam -o morc3ab_6hpf_2.bw
bamCoverage -bs 10 -p max -b morc3ab_6hpf_3_Aligned.sortedByCoord.out.bam -o morc3ab_6hpf_3.bw

bamCoverage -bs 10 -p max -b morc3b_6hpf_1_Aligned.sortedByCoord.out.bam -o morc3b_6hpf_1.bw
bamCoverage -bs 10 -p max -b morc3b_6hpf_2_Aligned.sortedByCoord.out.bam -o morc3b_6hpf_2.bw
bamCoverage -bs 10 -p max -b morc3b_6hpf_3_Aligned.sortedByCoord.out.bam -o morc3b_6hpf_3.bw

bamCoverage -bs 10 -p max -b wt_6hpf_1_Aligned.sortedByCoord.out.bam -o wt_6hpf_1.bw
bamCoverage -bs 10 -p max -b wt_6hpf_2_Aligned.sortedByCoord.out.bam -o wt_6hpf_2.bw
bamCoverage -bs 10 -p max -b wt_6hpf_3_Aligned.sortedByCoord.out.bam -o wt_6hpf_3.bw
