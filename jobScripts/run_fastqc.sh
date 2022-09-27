#!/bin/bash --login
#SBATCH --time=90:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=100GB
#SBATCH --output=%x-%j.SLURMout

#Change to current working directory
cd /mnt/home/kusiapp2/gitHub/plb812/data/

#Add conda environment to the path
export PATH="$/mnt/home/kusiapp2/miniconda3/bin:${PATH}"
#export LD_LIBRARY_PATH="$/mnt/home/kusiapp2/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

#run fastqc on all fastq files and output them into a folder
fastqc -t 10 -o /mnt/home/kusiapp2/gitHub/plb812/data/resultsFastqc *.fastq
