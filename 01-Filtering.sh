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

#Cornell_Lane 1. NY pops
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127048_H3J2HBGXH_owl17_GTCCGC_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127048_H3J2HBGXH_owl17_GTCCGC_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_NY17
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127047_H3J2HBGXH_owl16_CCGTCC_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127047_H3J2HBGXH_owl16_CCGTCC_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_NY16
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127046_H3J2HBGXH_owl15_ATGTCA_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127046_H3J2HBGXH_owl15_ATGTCA_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_NY15
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127045_H3J2HBGXH_owl14_AGTTCC_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127045_H3J2HBGXH_owl14_AGTTCC_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_NY14
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127044_H3J2HBGXH_owl13_AGTCAA_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127044_H3J2HBGXH_owl13_AGTCAA_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_NY13
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127043_H3J2HBGXH_owl12_CTTGTA_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127043_H3J2HBGXH_owl12_CTTGTA_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_NY12
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127042_H3J2HBGXH_owl11_GGCTAC_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127042_H3J2HBGXH_owl11_GGCTAC_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_NY11
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127041_H3J2HBGXH_owl10_TAGCTT_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127041_H3J2HBGXH_owl10_TAGCTT_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_NY10
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127040_H3J2HBGXH_owl9_GATCAG_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127040_H3J2HBGXH_owl9_GATCAG_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_NY9
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127039_H3J2HBGXH_owl8_ACTTGA_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127039_H3J2HBGXH_owl8_ACTTGA_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_NY8
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127038_H3J2HBGXH_owl7_CAGATC_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127038_H3J2HBGXH_owl7_CAGATC_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_NY7
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127037_H3J2HBGXH_owl6_GCCAAT_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127037_H3J2HBGXH_owl6_GCCAAT_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_NY6
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127036_H3J2HBGXH_owl5_ACAGTG_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127036_H3J2HBGXH_owl5_ACAGTG_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_NY5
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127035_H3J2HBGXH_owl3_TTAGGC_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127035_H3J2HBGXH_owl3_TTAGGC_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_NY3
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127034_H3J2HBGXH_owl2_CGATGT_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127034_H3J2HBGXH_owl2_CGATGT_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_NY2
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/12063_3270_127033_H3J2HBGXH_owl1_ATCACG_R1.fastq.gz --file2 /workdir/jlw395/12063_3270_127033_H3J2HBGXH_owl1_ATCACG_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_NY1

#Cornell Lane 2. OH pops
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_33_CKDL210027082-1a_H3KCHDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_33_CKDL210027082-1a_H3KCHDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_OH33
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_32_CKDL210027084-1a_H3KCHDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_32_CKDL210027084-1a_H3KCHDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_OH32
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_31_CKDL210027086-1a_H3KCHDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_31_CKDL210027086-1a_H3KCHDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_OH31
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_30_CKDL210027087-1a_H3KCHDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_30_CKDL210027087-1a_H3KCHDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_OH30
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_29_CKDL210027080-1a_H7W3WDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_29_CKDL210027080-1a_H7W3WDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_OH29
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_28_CKDL210027077-1a_H7W3WDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_28_CKDL210027077-1a_H7W3WDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_OH28
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_27_CKDL210027076-1a_H3KCHDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_27_CKDL210027076-1a_H3KCHDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_OH27
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_26_CKDL210027079-1a_H7W3WDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_26_CKDL210027079-1a_H7W3WDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_OH26
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_25_CKDL210027088-1a_H3KCHDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_25_CKDL210027088-1a_H3KCHDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_OH25
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_24_CKDL210027083-1a_H3KCHDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_24_CKDL210027083-1a_H3KCHDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_OH24
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_23_CKDL210027078-1a_H3KCHDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_23_CKDL210027078-1a_H3KCHDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_OH23
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_22_CKDL210027089-1a_H3KCHDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_22_CKDL210027089-1a_H3KCHDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_OH22
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_21_CKDL210027075-1a_H7W3WDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_21_CKDL210027075-1a_H7W3WDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_OH21
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_20_CKDL210027074-1a_H7W3WDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_20_CKDL210027074-1a_H7W3WDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_OH20
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_19_CKDL210027081-1a_H3KCHDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_19_CKDL210027081-1a_H3KCHDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_OH19
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/s_18_CKDL210027085-1a_H3KCHDSX3_L2_1.fq.gz --file2 /workdir/jlw395/s_18_CKDL210027085-1a_H3KCHDSX3_L2_2.fq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_OH18
