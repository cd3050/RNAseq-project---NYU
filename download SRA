#!/bin/bash
#SBATCH --job-name=fastq_download2
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8GB
#SBATCH --time=02:00:00
#SBATCH --mail-user=cd3050@nyu.edu
#SBATCH --mail-type=END

## download the SRA file
mkdir SRA
cd SRA

module load sra-tools/2.10.9
prefetch --option-file ../SraAccList.txt
cd..

###############
## run fastq
mkdir fastq2
cd fastq2

module load sra-tools/2.10.9
fasterq-dump --split-3 ../SRA/*/*.sra
cd..

###############
## run fastqc
module load fastqc/0.11.9
module list

mkdir FastQC

fastqc -o ./FastQC ./fastq2/*.fastq
cd ..


