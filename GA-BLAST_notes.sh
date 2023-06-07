# Script for blasting outlier regions
# author: Jen Walsh.

#You need to copy the database to your working directory before running BLAST.
#To use NCBI NT:
cp /shared_data/genome_db/BLAST_NCBI/nt* ./

#The latest version of the program is in your PATH, and can be used directly by typing its name at the prompt:
blastn -db nt -query owls_outliers_99_candidates.fa -out owls_outliers.out
