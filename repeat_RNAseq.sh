#PBS -S /bin/bash
#PBS -q batch
#PBS -N sat1_rnaseq
#PBS -l nodes=2:ppn=12:AMD
#PBS -l walltime=72:00:00
#PBS -l mem=20gb
#PBS -M audrey.calvird@uga.edu
#PBS -m abe

cd $PBS_O_WORKDIR
#cd /scratch/aec16885
#mkdir sat1
#cd sat1
cd /scratch/aec16885/sat1

#downloadfiles
#0.75hpf-2cells
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/006/ERR1442626/ERR1442626_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/006/ERR1442626/ERR1442626_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/007/ERR1442627/ERR1442627_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/007/ERR1442627/ERR1442627_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/008/ERR1442628/ERR1442628_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/008/ERR1442628/ERR1442628_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/009/ERR1442629/ERR1442629_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/009/ERR1442629/ERR1442629_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/000/ERR1442630/ERR1442630_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/000/ERR1442630/ERR1442630_2.fastq.gz"
#2.25hpf-128cells
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/001/ERR1442631/ERR1442631_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/001/ERR1442631/ERR1442631_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/002/ERR1442632/ERR1442632_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/002/ERR1442632/ERR1442632_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/003/ERR1442633/ERR1442633_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/003/ERR1442633/ERR1442633_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/004/ERR1442634/ERR1442634_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/004/ERR1442634/ERR1442634_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/005/ERR1442635/ERR1442635_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/005/ERR1442635/ERR1442635_2.fastq.gz"
#4.5hpf-dome
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/001/ERR1442621/ERR1442621_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/001/ERR1442621/ERR1442621_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/002/ERR1442622/ERR1442622_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/002/ERR1442622/ERR1442622_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/003/ERR1442623/ERR1442623_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/003/ERR1442623/ERR1442623_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/004/ERR1442624/ERR1442624_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/004/ERR1442624/ERR1442624_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/005/ERR1442625/ERR1442625_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/005/ERR1442625/ERR1442625_2.fastq.gz"
#6hpf-sheild
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/001/ERR1442601/ERR1442601_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/001/ERR1442601/ERR1442601_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/002/ERR1442602/ERR1442602_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/002/ERR1442602/ERR1442602_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/003/ERR1442603/ERR1442603_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/003/ERR1442603/ERR1442603_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/004/ERR1442604/ERR1442604_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/004/ERR1442604/ERR1442604_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/005/ERR1442605/ERR1442605_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/005/ERR1442605/ERR1442605_2.fastq.gz"
#24hpf-prim5
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/006/ERR1442566/ERR1442566_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/006/ERR1442566/ERR1442566_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/007/ERR1442567/ERR1442567_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/007/ERR1442567/ERR1442567_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/008/ERR1442568/ERR1442568_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/008/ERR1442568/ERR1442568_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/009/ERR1442569/ERR1442569_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/009/ERR1442569/ERR1442569_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/000/ERR1442570/ERR1442570_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/000/ERR1442570/ERR1442570_2.fastq.gz"
#3dpf-protrudingmouth
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/006/ERR1442586/ERR1442586_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/006/ERR1442586/ERR1442586_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/007/ERR1442587/ERR1442587_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/007/ERR1442587/ERR1442587_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/008/ERR1442588/ERR1442588_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/008/ERR1442588/ERR1442588_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/009/ERR1442589/ERR1442589_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/009/ERR1442589/ERR1442589_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/000/ERR1442590/ERR1442590_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/000/ERR1442590/ERR1442590_2.fastq.gz"
#5dpf
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/006/ERR1442596/ERR1442596_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/006/ERR1442596/ERR1442596_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/007/ERR1442597/ERR1442597_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/007/ERR1442597/ERR1442597_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/008/ERR1442598/ERR1442598_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/008/ERR1442598/ERR1442598_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/009/ERR1442599/ERR1442599_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/009/ERR1442599/ERR1442599_2.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/000/ERR1442600/ERR1442600_1.fastq.gz"
#wget "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR144/000/ERR1442600/ERR1442600_2.fastq.gz"

#trim reads
#module load Trim_Galore/0.6.5-GCCcore-8.2.0-Java-11
#trim 2 cell
#trim_galore -q 20 --paired ERR1442626_1.fastq.gz ERR1442626_2.fastq.gz
#trim_galore -q 20 --paired ERR1442627_1.fastq.gz ERR1442627_2.fastq.gz
#trim_galore -q 20 --paired ERR1442628_1.fastq.gz ERR1442628_2.fastq.gz
#trim_galore -q 20 --paired ERR1442629_1.fastq.gz ERR1442629_2.fastq.gz
#trim_galore -q 20 --paired ERR1442630_1.fastq.gz ERR1442630_2.fastq.gz
#trim 128 cell
#trim_galore -q 20 --paired ERR1442631_1.fastq.gz ERR1442631_2.fastq.gz
#trim_galore -q 20 --paired ERR1442632_1.fastq.gz ERR1442632_2.fastq.gz
#trim_galore -q 20 --paired ERR1442633_1.fastq.gz ERR1442633_2.fastq.gz
#trim_galore -q 20 --paired ERR1442634_1.fastq.gz ERR1442634_2.fastq.gz
#trim_galore -q 20 --paired ERR1442635_1.fastq.gz ERR1442635_2.fastq.gz
#trim dome
#trim_galore -q 20 --paired ERR1442621_1.fastq.gz ERR1442621_2.fastq.gz
#trim_galore -q 20 --paired ERR1442622_1.fastq.gz ERR1442622_2.fastq.gz
#trim_galore -q 20 --paired ERR1442623_1.fastq.gz ERR1442623_2.fastq.gz
#trim_galore -q 20 --paired ERR1442624_1.fastq.gz ERR1442624_2.fastq.gz
#trim_galore -q 20 --paired ERR1442625_1.fastq.gz ERR1442625_2.fastq.gz
#trim shield
#trim_galore -q 20 --paired ERR1442601_1.fastq.gz ERR1442601_2.fastq.gz
#trim_galore -q 20 --paired ERR1442602_1.fastq.gz ERR1442602_2.fastq.gz
#trim_galore -q 20 --paired ERR1442603_1.fastq.gz ERR1442603_2.fastq.gz
#trim_galore -q 20 --paired ERR1442604_1.fastq.gz ERR1442604_2.fastq.gz
#trim_galore -q 20 --paired ERR1442605_1.fastq.gz ERR1442605_2.fastq.gz
#trim prim5
#trim_galore -q 20 --paired ERR1442566_1.fastq.gz ERR1442566_2.fastq.gz
#trim_galore -q 20 --paired ERR1442567_1.fastq.gz ERR1442567_2.fastq.gz
#trim_galore -q 20 --paired ERR1442568_1.fastq.gz ERR1442568_2.fastq.gz
#trim_galore -q 20 --paired ERR1442569_1.fastq.gz ERR1442569_2.fastq.gz
#trim_galore -q 20 --paired ERR1442570_1.fastq.gz ERR1442570_2.fastq.gz
#trim protrudingmouth
#trim_galore -q 20 --paired ERR1442586_1.fastq.gz ERR1442586_2.fastq.gz
#trim_galore -q 20 --paired ERR1442587_1.fastq.gz ERR1442587_2.fastq.gz
#trim_galore -q 20 --paired ERR1442588_1.fastq.gz ERR1442588_2.fastq.gz
#trim_galore -q 20 --paired ERR1442589_1.fastq.gz ERR1442589_2.fastq.gz
#trim_galore -q 20 --paired ERR1442590_1.fastq.gz ERR1442590_2.fastq.gz
#trim 5dpf
#trim_galore -q 20 --paired ERR1442596_1.fastq.gz ERR1442596_2.fastq.gz
#trim_galore -q 20 --paired ERR1442597_1.fastq.gz ERR1442597_2.fastq.gz
#trim_galore -q 20 --paired ERR1442598_1.fastq.gz ERR1442598_2.fastq.gz
#trim_galore -q 20 --paired ERR1442599_1.fastq.gz ERR1442599_2.fastq.gz
#trim_galore -q 20 --paired ERR1442600_1.fastq.gz ERR1442600_2.fastq.gz


#align trimmed reads
#module load HISAT2/2.1.0-foss-2016b
#hisat2-build danRer11.fa GRCz11_index

#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442626_1_val_1.fq.gz -2 ERR1442626_2_val_2.fq.gz -S 2cell_1.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442627_1_val_1.fq.gz -2 ERR1442627_2_val_2.fq.gz -S 2cell_2.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442628_1_val_1.fq.gz -2 ERR1442628_2_val_2.fq.gz -S 2cell_3.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442629_1_val_1.fq.gz -2 ERR1442629_2_val_2.fq.gz -S 2cell_4.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442630_1_val_1.fq.gz -2 ERR1442630_2_val_2.fq.gz -S 2cell_5.sam

#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442631_1_val_1.fq.gz -2 ERR1442631_2_val_2.fq.gz -S 128cell_1.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442632_1_val_1.fq.gz -2 ERR1442632_2_val_2.fq.gz -S 128cell_2.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442633_1_val_1.fq.gz -2 ERR1442633_2_val_2.fq.gz -S 128cell_3.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442634_1_val_1.fq.gz -2 ERR1442634_2_val_2.fq.gz -S 128cell_4.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442635_1_val_1.fq.gz -2 ERR1442635_2_val_2.fq.gz -S 128cell_5.sam

#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442621_1_val_1.fq.gz -2 ERR1442621_2_val_2.fq.gz -S dome_1.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442622_1_val_1.fq.gz -2 ERR1442622_2_val_2.fq.gz -S dome_2.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442623_1_val_1.fq.gz -2 ERR1442623_2_val_2.fq.gz -S dome_3.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442624_1_val_1.fq.gz -2 ERR1442624_2_val_2.fq.gz -S dome_4.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442625_1_val_1.fq.gz -2 ERR1442625_2_val_2.fq.gz -S dome_5.sam

#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442601_1_val_1.fq.gz -2 ERR1442601_2_val_2.fq.gz -S shield_1.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442602_1_val_1.fq.gz -2 ERR1442602_2_val_2.fq.gz -S shield_2.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442603_1_val_1.fq.gz -2 ERR1442603_2_val_2.fq.gz -S shield_3.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442604_1_val_1.fq.gz -2 ERR1442604_2_val_2.fq.gz -S shield_4.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442605_1_val_1.fq.gz -2 ERR1442605_2_val_2.fq.gz -S shield_5.sam

#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442566_1_val_1.fq.gz -2 ERR1442566_2_val_2.fq.gz -S prim5_1.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442567_1_val_1.fq.gz -2 ERR1442567_2_val_2.fq.gz -S prim5_2.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442568_1_val_1.fq.gz -2 ERR1442568_2_val_2.fq.gz -S prim5_3.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442569_1_val_1.fq.gz -2 ERR1442569_2_val_2.fq.gz -S prim5_4.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442570_1_val_1.fq.gz -2 ERR1442570_2_val_2.fq.gz -S prim5_5.sam

#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442586_1_val_1.fq.gz -2 ERR1442586_2_val_2.fq.gz -S protrudingmouth_1.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442587_1_val_1.fq.gz -2 ERR1442587_2_val_2.fq.gz -S protrudingmouth_2.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442588_1_val_1.fq.gz -2 ERR1442588_2_val_2.fq.gz -S protrudingmouth_3.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442589_1_val_1.fq.gz -2 ERR1442589_2_val_2.fq.gz -S protrudingmouth_4.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442590_1_val_1.fq.gz -2 ERR1442590_2_val_2.fq.gz -S protrudingmouth_5.sam

#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442596_1_val_1.fq.gz -2 ERR1442596_2_val_2.fq.gz -S 5dpf_1.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442597_1_val_1.fq.gz -2 ERR1442597_2_val_2.fq.gz -S 5dpf_2.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442598_1_val_1.fq.gz -2 ERR1442598_2_val_2.fq.gz -S 5dpf_3.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442599_1_val_1.fq.gz -2 ERR1442599_2_val_2.fq.gz -S 5dpf_4.sam
#hisat2 -q --no-mixed --rna-strandness FR --secondary -k 10 -x GRCz11_index -1 ERR1442600_1_val_1.fq.gz -2 ERR1442600_2_val_2.fq.gz -S 5dpf_5.sam

#count aligned reads
#module load HTSeq/0.9.1-foss-2016b-Python-2.7.14

#htseq-count -r name -s yes -a 10 -t exon -i gene_id -m intersection-nonempty --nonunique=all --secondary-alignments=ignore n1_alignment.sam n2_alignment.sam n3_alignment.sam wt1_alignment.sam wt2_alignment.sam wt3_alignment.sam danRer11.repeatmsk.gtf.gz > nsd1_repeats_countsfile.txt

module load Subread/1.6.2

featureCounts -p -B -M -O -g gene_id -a danRer11.repeatmsk.gtf.gz -o repeat_MZT.txt 2cell_1.sam 2cell_2.sam 2cell_3.sam 2cell_4.sam 2cell_5.sam 128cell_1.sam 128cell_2.sam 128cell_3.sam 128cell_4.sam 128cell_5.sam dome_1.sam dome_2.sam dome_3.sam dome_4.sam dome_5.sam shield_1.sam shield_2.sam shield_3.sam shield_4.sam shield_5.sam prim5_1.sam prim5_2.sam prim5_3.sam prim5_4.sam prim5_5.sam protrudingmouth_1.sam protrudingmouth_2.sam protrudingmouth_3.sam protrudingmouth_4.sam protrudingmouth_5.sam 5dpf_1.sam 5dpf_2.sam 5dpf_3.sam 5dpf_4.sam 5dpf_5.sam
