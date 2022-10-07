#!/bin/bash --login
#SBATCH --time=90:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=100GB
#SBATCH --output=%x-%j.SLURMout
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kusiapp2@msu.edu

#Assign Variables
ERR1="ERR754063"
ERR2="ERR754073"
ERR3="ERR754081"
ERR4="ERR754085"

#Change directory to downloaded .fastq
cd /mnt/home/kusiapp2/gitHub/plb812/data/

#Find adapters of .fastq and output in directory
bbmerge.sh in1=${ERR1}_1.fastq in2=${ERR1}_2.fastq outa=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/adapters/adapters${ERR1}.fa
bbmerge.sh in1=${ERR2}_1.fastq in2=${ERR2}_2.fastq outa=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/adapters/adapters${ERR2}.fa
bbmerge.sh in1=${ERR3}_1.fastq in2=${ERR3}_2.fastq outa=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/adapters/adapters${ERR3}.fa
bbmerge.sh in1=${ERR4}_1.fastq in2=${ERR4}_2.fastq outa=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/adapters/adapters${ERR4}.fa

#Trim .fastq and output in directory
bbduk.sh in1=${ERR1}_1.fastq in2=${ERR1}_2.fastq out1=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/trimmed${ERR1}_1.fastq out2=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/trimmed${ERR1}_2.fastq ref=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/adapters/adapters${ERR2}.fa ktrim=r k=23 mink=11 hdist=1 qtrim=rl trimq=30 maq=30 overwrite=true tpe tbo
bbduk.sh in1=${ERR2}_1.fastq in2=${ERR2}_2.fastq out1=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/trimmed${ERR2}_1.fastq out2=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/trimmed${ERR2}_2.fastq ref=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/adapters/adapters${ERR2}.fa ktrim=r k=23 mink=11 hdist=1 qtrim=rl trimq=30 maq=30 overwrite=true tpe tbo
bbduk.sh in1=${ERR3}_1.fastq in2=${ERR3}_2.fastq out1=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/trimmed${ERR3}_1.fastq out2=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/trimmed${ERR3}_2.fastq ref=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/adapters/adapters${ERR3}.fa ktrim=r k=23 mink=11 hdist=1 qtrim=rl trimq=30 maq=30 overwrite=true tpe tbo
bbduk.sh in1=${ERR4}_1.fastq in2=${ERR4}_2.fastq out1=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/trimmed${ERR4}_1.fastq out2=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/trimmed${ERR4}_2.fastq ref=/mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq/adapters/adapters${ERR4}.fa ktrim=r k=23 mink=11 hdist=1 qtrim=rl trimq=30 maq=30 overwrite=true tpe tbo

#Change directory to trimmed .fastq
cd /mnt/home/kusiapp2/gitHub/plb812/data/trimmedFastq

#Fastqc all . fastq and output in directory
fastqc -t 10 -o /mnt/home/kusiapp2/gitHub/plb812/data/resultsFastqc/trimmed *.fastq
