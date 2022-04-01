#!/bin/bash
#SBATCH --job-name=HtSeq
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8GB
#SBATCH --time=10:00:00
#SBATCH --mail-user=cd3050@nyu.edu
#SBATCH --mail-type=END

#### HtSeq used for RNA-seq counting

module load htseq/0.13.5

mkdir HtSeq
cd HtSeq

for file in `ls ../STAR3/*.bam`
do
k=${file##*/}
kk=${k%%.*}
output=${kk:0:11}

htseq-count -f bam \
-r name \
-s no \
../STAR/$file \
../hg19.refGene.gtf > $output.txt

done

cd ..
