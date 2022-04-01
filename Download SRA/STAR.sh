#!/bin/bash
#SBATCH --job-name=STAR2
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=10:00:00
#SBATCH --mail-user=cd3050@nyu.edu
#SBATCH --mail-type=END

module load star/intel/2.7.6a

mkdir STAR3
cd STAR3

mkdir STAR_anno_index

STAR --runThreadN 2 \
--runMode genomeGenerate \
--genomeSAindexNbases 11 \
--genomeDir ./STAR_anno_index \
--genomeFastaFiles ../hg19.fa \
--sjdbGTFfile ../hg19.refGene.gtf \
--sjdbOverhang 150

for file in `ls ../fastq2`
do
STAR --genomeDir ./STAR_anno_index \
--runThreadN 8 \
--readFilesIn ../fastq2/$file \
--outFileNamePrefix ./${file%.*} \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard
done


cd ..
