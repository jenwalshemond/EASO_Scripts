#Grasshopper Sparrow Project
#Jen Walsh, March 2023
#QC and adapter removal for resequencing data
#FASTQC
find *.gz -type f > listOfFiles.list

awk -v FS="\t" '
{
    if (NR > 0){
        samp=$1
        print "fastqc"  " " samp
    }
}
' listOfFiles.list > list.txt


parallel -j 22 < /workdir/jlw395/list.txt


# Run fastqc.sh script on terminal and view output using:
export LC_ALL=en_US.UTF-8
export PATH=/programs/miniconda3/bin:$PATH
source activate multiqc

# run software using command:
multiqc .

# after done running deactivate conda
conda deactivate

# there will be a file called multiqc_report.html. Copy this to your computer and visualize in web browser.


#Script for trimming and adpater removal

#Trimns: Trim consecutive Ns from the 5’ and 3’ termini. If quality trimming is also enabled (--trimqualities), then stretches of mixed low-quality bases and/or Ns are trimmed.
#Trimqualities: Trim consecutive stretches of low quality bases (threshold set by --minquality) from the 5’ and 3’ termini. If trimming of Ns is also enabled (--trimns), then stretches of mixed low-quality bases and Ns are trimmed.
#minquality: Set the threshold for trimming low quality bases using --trimqualities and --trimwindows. Default is 2
#collapse: In paired-end mode, merge overlapping mates into a single and recalculate the quality scores. In single-end mode, attempt to identify templates for which the entire sequence is available. In both cases, complete “collapsed” reads are written with a ‘M_’ name prefix, and “collapsed” reads which are trimmed due to quality settings are written with a ‘MT_’ name prefix.
#adapterlist: Read one or more adapter sequences from a table. The first two columns (separated by whitespace) of each line in the file are expected to correspond to values passed to –adapter1 and –adapter2.
#minlength: Reads shorter than this length are discarded following trimming. Defaults to 15Reads shorter than this length are discarded following trimming. Defaults to 15.

# /programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 Pathto/R1.fastq.gz --file2 Pathto/R2.fastq.gz --trimns --trimqualities --minquality 20 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename LIBRARY_SAMPLEID


/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP23_JM-20-18_S22_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP23_JM-20-18_S22_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP23_JM-20-18
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP11_DR-20_S10_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP11_DR-20_S10_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP11_DR-20
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP12_DR-PB05-14_S11_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP12_DR-PB05-14_S11_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP12_DR-PB05-14
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP13_MD-18_S12_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP13_MD-18_S12_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP13_MD-18
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP14_MD-91_S13_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP14_MD-91_S13_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP14_MD-91
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP15_MD-93_S14_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP15_MD-93_S14_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP15_MD-93
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP16_MD-190_S15_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP16_MD-190_S15_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP16_MD-190
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP17_MD-262_S16_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP17_MD-262_S16_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP17_MD-262
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP18_MD-344_S17_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP18_MD-344_S17_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP18_MD-344
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP19_JM-2-18_S18_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP19_JM-2-18_S18_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP19_JM-2-18
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP20_JM-5-18_S19_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP20_JM-5-18_S19_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP20_JM-5-18
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP21_JM-13-18_S20_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP21_JM-13-18_S20_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP21_JM-13-18
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP22_JM-16-18_S21_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP22_JM-16-18_S21_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP22_JM-16-18
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP24_JM-24-18_S23_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP24_JM-24-18_S23_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP24_JM-24-18
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP25_FL-64509_S24_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP25_FL-64509_S24_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP25_FL-64509
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP26_FL-63316_S25_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP26_FL-63316_S25_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP26_FL-63316
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP27_FL-63341_S26_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP27_FL-63341_S26_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP27_FL-63341
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP28_FL-05716_S27_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP28_FL-05716_S27_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP28_FL-05716
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP29_FL-05740_S28_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP29_FL-05740_S28_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP29_FL-05740
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP30_GA-47792_S29_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP30_GA-47792_S29_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP30_GA-47792
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP31_GA-47904_S30_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP31_GA-47904_S30_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP31_GA-47904
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP32_GA-47908_S31_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP32_GA-47908_S31_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP32_GA-47908
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP33_GA-47912_S32_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP33_GA-47912_S32_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP33_GA-47912
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP34_GA-47921_S33_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP34_GA-47921_S33_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP34_GA-47921
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP35_KS-1837_S34_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP35_KS-1837_S34_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP35_KS-1837
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP36_KS-1938_S35_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP36_KS-1938_S35_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP36_KS-1938
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP37_KS-1958_S36_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP37_KS-1958_S36_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP37_KS-1958
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP38_KS-1995_S37_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP38_KS-1995_S37_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP38_KS-1995
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP39_KS-2019_S38_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP39_KS-2019_S38_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP39_KS-2019
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP3_PR-13_S3_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP3_PR-13_S3_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP3_PR-13
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP40_KS-2078_S39_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP40_KS-2078_S39_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP40_KS-2078
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP4_PR-17_S4_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP4_PR-17_S4_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP4_PR-17
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP5_PR-22_S5_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP5_PR-22_S5_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP5_PR-22
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP6_PR-30_S6_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP6_PR-30_S6_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP6_PR-30
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP7_DR-1_S7_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP7_DR-1_S7_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP7_DR-1
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP8_DR-8_S8_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP8_DR-8_S8_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP8_DR-8
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP9_DR-12_S9_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP9_DR-12_S9_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP9_DR-12
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP1_PR-1_S1_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP1_PR-1_S1_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP1_PR-1
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/GRSP2_PR-12_S2_L002_R1_001.fastq.gz --file2 /workdir/jlw395/GRSP2_PR-12_S2_L002_R2_001.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename GRSP2_PR-12
