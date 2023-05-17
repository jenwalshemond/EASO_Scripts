#EASO Project
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

#Data from Sarah
#Concatenate reads across three lanes
cat Lane_1_S6_Masio_11_ATCCGC.R1.fastq.gz Lane_3_S6_Masio_11_ATCCGC.R1.fastq.gz Lane_4_S6_Masio_11_ATCCGC.R1.fastq.gz > Ruf_IL6_R1.fastq.gz
cat Lane_1_S6_Masio_11_ATCCGC.R2.fastq.gz Lane_3_S6_Masio_11_ATCCGC.R2.fastq.gz Lane_4_S6_Masio_11_ATCCGC.R2.fastq.gz > Ruf_IL6_R2.fastq.gz
cat Lane_1_S31_Masio_08_ATGTCA.R1.fastq.gz Lane_3_S31_Masio_08_ATGTCA.R1.fastq.gz Lane_4_S31_Masio_08_ATGTCA.R1.fastq.gz > Ruf_IL31_R1.fastq.gz
cat Lane_1_S31_Masio_08_ATGTCA.R2.fastq.gz Lane_3_S31_Masio_08_ATGTCA.R2.fastq.gz Lane_4_S31_Masio_08_ATGTCA.R2.fastq.gz > Ruf_IL31_R2.fastq.gz
cat Lane_1_S28_Masio_07_AGTTCC.R1.fastq.gz Lane_3_S28_Masio_07_AGTTCC.R1.fastq.gz Lane_4_S28_Masio_07_AGTTCC.R1.fastq.gz > Ruf_IL28_R1.fastq.gz
cat Lane_1_S28_Masio_07_AGTTCC.R2.fastq.gz Lane_3_S28_Masio_07_AGTTCC.R2.fastq.gz Lane_4_S28_Masio_07_AGTTCC.R2.fastq.gz > Ruf_IL28_R2.fastq.gz
cat Lane_1_S20_Masio_06_GCCATA.R1.fastq.gz Lane_3_S20_Masio_06_GCCATA.R1.fastq.gz Lane_4_S20_Masio_06_GCCATA.R1.fastq.gz > Ruf_IL20_R1.fastq.gz
cat Lane_1_S20_Masio_06_GCCATA.R2.fastq.gz Lane_3_S20_Masio_06_GCCATA.R2.fastq.gz Lane_4_S20_Masio_06_GCCATA.R2.fastq.gz > Ruf_IL20_R2.fastq.gz
cat Lane_1_S19_Masio_05_TTAGCT.R1.fastq.gz Lane_3_S19_Masio_05_TTAGCT.R1.fastq.gz Lane_4_S19_Masio_05_TTAGCT.R1.fastq.gz > Ruf_MN19_R1.fastq.gz
cat Lane_1_S19_Masio_05_TTAGCT.R2.fastq.gz Lane_3_S19_Masio_05_TTAGCT.R2.fastq.gz Lane_4_S19_Masio_05_TTAGCT.R2.fastq.gz > Ruf_MN19_R2.fastq.gz
cat Lane_1_S17_Masio_19_AGACCA.R1.fastq.gz Lane_3_S17_Masio_19_AGACCA.R1.fastq.gz Lane_4_S17_Masio_19_AGACCA.R1.fastq.gz > Gray_WI17_R1.fastq.gz
cat Lane_1_S17_Masio_19_AGACCA.R2.fastq.gz Lane_3_S17_Masio_19_AGACCA.R2.fastq.gz Lane_4_S17_Masio_19_AGACCA.R2.fastq.gz > Gray_WI17_R2.fastq.gz
cat Lane_1_S13_Masio_04_GTAGGC.R1.fastq.gz Lane_3_S13_Masio_04_GTAGGC.R1.fastq.gz Lane_4_S13_Masio_04_GTAGGC.R1.fastq.gz > Ruf_WI13_R1.fastq.gz
cat Lane_1_S13_Masio_04_GTAGGC.R2.fastq.gz Lane_3_S13_Masio_04_GTAGGC.R2.fastq.gz Lane_4_S13_Masio_04_GTAGGC.R2.fastq.gz > Ruf_WI13_R2.fastq.gz
cat Lane_1_S11_Masio_12_CAGTGT.R1.fastq.gz Lane_3_S11_Masio_12_CAGTGT.R1.fastq.gz Lane_4_S11_Masio_12_CAGTGT.R1.fastq.gz > Gray_WI11_R1.fastq.gz
cat Lane_1_S11_Masio_12_CAGTGT.R2.fastq.gz Lane_3_S11_Masio_12_CAGTGT.R2.fastq.gz Lane_4_S11_Masio_12_CAGTGT.R2.fastq.gz > Gray_WI11_R2.fastq.gz

cat Lane_5_S9_Masio_17_CTGGCC.R1.fastq.gz Lane_2_S9_Masio_17_CTGGCC.R1.fastq.gz Lane_6_S9_Masio_17_CTGGCC.R1.fastq.gz > Gray_WI9_R1.fastq.gz
cat Lane_5_S9_Masio_17_CTGGCC.R2.fastq.gz Lane_2_S9_Masio_17_CTGGCC.R2.fastq.gz Lane_6_S9_Masio_17_CTGGCC.R2.fastq.gz > Gray_WI9_R2.fastq.gz
cat Lane_5_S7_Masio_16_CTGAAA.R1.fastq.gz Lane_2_S7_Masio_16_CTGAAA.R1.fastq.gz Lane_6_S7_Masio_16_CTGAAA.R1.fastq.gz > Ruf_WI7_R1.fastq.gz
cat Lane_5_S7_Masio_16_CTGAAA.R2.fastq.gz Lane_2_S7_Masio_16_CTGAAA.R2.fastq.gz Lane_6_S7_Masio_16_CTGAAA.R2.fastq.gz > Ruf_WI7_R2.fastq.gz
cat Lane_5_S32_Masio_05_GAGTGG.R1.fastq.gz Lane_2_S32_Masio_05_GAGTGG.R1.fastq.gz Lane_6_S32_Masio_05_GAGTGG.R1.fastq.gz > Gray_IL32_R1.fastq.gz
cat Lane_5_S32_Masio_05_GAGTGG.R2.fastq.gz Lane_2_S32_Masio_05_GAGTGG.R2.fastq.gz Lane_6_S32_Masio_05_GAGTGG.R2.fastq.gz > Gray_IL32_R2.fastq.gz
cat Lane_5_S1_Masio_14_CAGCTT.R1.fastq.gz Lane_2_S1_Masio_14_CAGCTT.R1.fastq.gz Lane_6_S1_Masio_14_CAGCTT.R1.fastq.gz > Ruf_IL1_R1.fastq.gz
cat Lane_5_S1_Masio_14_CAGCTT.R2.fastq.gz Lane_2_S1_Masio_14_CAGCTT.R2.fastq.gz Lane_6_S1_Masio_14_CAGCTT.R2.fastq.gz > Ruf_IL1_R2.fastq.gz
cat Lane_5_S18_Masio_11_GGCTAC.R1.fastq.gz Lane_2_S18_Masio_11_GGCTAC.R1.fastq.gz Lane_6_S18_Masio_11_GGCTAC.R1.fastq.gz > Gray_WI18_R1.fastq.gz
cat Lane_5_S18_Masio_11_GGCTAC.R2.fastq.gz Lane_2_S18_Masio_11_GGCTAC.R2.fastq.gz Lane_6_S18_Masio_11_GGCTAC.R2.fastq.gz > Gray_WI18_R2.fastq.gz
cat Lane_5_S16_Masio_09_TCCTAG.R1.fastq.gz Lane_2_S16_Masio_09_TCCTAG.R1.fastq.gz Lane_6_S16_Masio_09_TCCTAG.R1.fastq.gz > Mix_WI16_R1.fastq.gz
cat Lane_5_S16_Masio_09_TCCTAG.R2.fastq.gz Lane_2_S16_Masio_09_TCCTAG.R2.fastq.gz Lane_6_S16_Masio_09_TCCTAG.R2.fastq.gz > Mix_WI16_R2.fastq.gz
cat Lane_5_S15_Masio_04_AGGTAC.R1.fastq.gz Lane_2_S15_Masio_04_AGGTAC.R1.fastq.gz > Gray_IL15_R1.fastq.gz
cat Lane_5_S15_Masio_04_AGGTAC.R2.fastq.gz Lane_2_S15_Masio_04_AGGTAC.R2.fastq.gz Lane_6_S15_Masio_04_AGGTAC.R2.fastq.gz > Gray_IL15_R2.fastq.gz
cat Lane_5_S14_Masio_03_TTCGAA.R1.fastq.gz Lane_2_S14_Masio_03_TTCGAA.R1.fastq.gz Lane_6_S14_Masio_03_TTCGAA.R1.fastq.gz > Mix_WI14_R1.fastq.gz
cat Lane_5_S14_Masio_03_TTCGAA.R2.fastq.gz Lane_2_S14_Masio_03_TTCGAA.R2.fastq.gz Lane_6_S14_Masio_03_TTCGAA.R2.fastq.gz > Mix_WI14_R2.fastq.gz
cat Lane_5_S10_Masio_18_TAATGT.R1.fastq.gz Lane_2_S10_Masio_18_TAATGT.R1.fastq.gz Lane_6_S10_Masio_18_TAATGT.R1.fastq.gz > Gray_IL10_R1.fastq.gz
cat Lane_5_S10_Masio_18_TAATGT.R2.fastq.gz Lane_2_S10_Masio_18_TAATGT.R2.fastq.gz Lane_6_S10_Masio_18_TAATGT.R2.fastq.gz > Gray_IL10_R2.fastq.gz

cat Lane_3_S3_Masio_04_AGCTTT.R1.fastq.gz Lane_8_S3_Masio_04_AGCTTT.R1.fastq.gz Lane_7_S3_Masio_04_AGCTTT.R1.fastq.gz > Ruf_IA3_R1.fastq.gz
cat Lane_3_S3_Masio_04_AGCTTT.R2.fastq.gz Lane_8_S3_Masio_04_AGCTTT.R2.fastq.gz Lane_7_S3_Masio_04_AGCTTT.R2.fastq.gz > Ruf_IA3_R2.fastq.gz
cat Lane_3_S27_Masio_07_CTTGTA.R1.fastq.gz Lane_8_S27_Masio_07_CTTGTA.R1.fastq.gz Lane_7_S27_Masio_07_CTTGTA.R1.fastq.gz > Gray_WI27_R1.fastq.gz
cat Lane_3_S27_Masio_07_CTTGTA.R2.fastq.gz Lane_8_S27_Masio_07_CTTGTA.R2.fastq.gz Lane_7_S27_Masio_07_CTTGTA.R2.fastq.gz > Gray_WI27_R2.fastq.gz
cat Lane_3_S26_Masio_12_GCCAAT.R1.fastq.gz Lane_8_S26_Masio_12_GCCAAT.R1.fastq.gz Lane_7_S26_Masio_12_GCCAAT.R1.fastq.gz > Gray_WI26_R1.fastq.gz
cat Lane_3_S26_Masio_12_GCCAAT.R2.fastq.gz Lane_8_S26_Masio_12_GCCAAT.R2.fastq.gz Lane_7_S26_Masio_12_GCCAAT.R2.fastq.gz > Gray_WI26_R2.fastq.gz
cat Lane_3_S25_Masio_05_TGACCA.R1.fastq.gz Lane_8_S25_Masio_05_TGACCA.R1.fastq.gz Lane_7_S25_Masio_05_TGACCA.R1.fastq.gz > Ruf_IL25_R1.fastq.gz
cat Lane_3_S25_Masio_05_TGACCA.R2.fastq.gz Lane_8_S25_Masio_05_TGACCA.R2.fastq.gz Lane_7_S25_Masio_05_TGACCA.R2.fastq.gz > Ruf_IL25_R2.fastq.gz
cat Lane_3_S24_Masio_03_TCGGAT.R1.fastq.gz Lane_8_S24_Masio_03_TCGGAT.R1.fastq.gz Lane_7_S24_Masio_03_TCGGAT.R1.fastq.gz > Gray_IL24_R1.fastq.gz
cat Lane_3_S24_Masio_03_TCGGAT.R2.fastq.gz Lane_8_S24_Masio_03_TCGGAT.R2.fastq.gz Lane_7_S24_Masio_03_TCGGAT.R2.fastq.gz > Gray_IL24_R2.fastq.gz
cat Lane_3_S22_Masio_08_AGTCAA.R1.fastq.gz Lane_8_S22_Masio_08_AGTCAA.R1.fastq.gz Lane_7_S22_Masio_08_AGTCAA.R1.fastq.gz > Ruf_IL22_R1.fastq.gz
cat Lane_3_S22_Masio_08_AGTCAA.R2.fastq.gz Lane_8_S22_Masio_08_AGTCAA.R2.fastq.gz Lane_7_S22_Masio_08_AGTCAA.R2.fastq.gz > Ruf_IL22_R2.fastq.gz
cat Lane_3_S21_Masio_13_CATTAG.R1.fastq.gz Lane_8_S21_Masio_13_CATTAG.R1.fastq.gz Lane_7_S21_Masio_13_CATTAG.R1.fastq.gz > Ruf_WI21_R1.fastq.gz
cat Lane_3_S21_Masio_13_CATTAG.R2.fastq.gz Lane_8_S21_Masio_13_CATTAG.R2.fastq.gz Lane_7_S21_Masio_13_CATTAG.R2.fastq.gz > Ruf_WI21_R2.fastq.gz


/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_IL6_R1.fastq.gz --file2 /workdir/jlw395/Ruf_IL6_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_IL6
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_IL31_R1.fastq.gz --file2 /workdir/jlw395/Ruf_IL31_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_IL31
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_IL28_R1.fastq.gz --file2 /workdir/jlw395/Ruf_IL28_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_IL28
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_IL20_R1.fastq.gz --file2 /workdir/jlw395/Ruf_IL20_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_IL20
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_MN19_R1.fastq.gz --file2 /workdir/jlw395/Ruf_MN19_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_MN19
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Gray_WI17_R1.fastq.gz --file2 /workdir/jlw395/Gray_WI17_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_WI17
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_WI13_R1.fastq.gz --file2 /workdir/jlw395/Ruf_WI13_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_WI13
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Gray_WI11_R1.fastq.gz --file2 /workdir/jlw395/Gray_WI11_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_WI11
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Gray_WI9_R1.fastq.gz --file2 /workdir/jlw395/Gray_WI9_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_WI9
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_WI7_R1.fastq.gz --file2 /workdir/jlw395/Ruf_WI7_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_WI7
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Gray_IL32_R1.fastq.gz --file2 /workdir/jlw395/Gray_IL32_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_IL32
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_IL1_R1.fastq.gz --file2 /workdir/jlw395/Ruf_IL1_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_IL1
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Gray_WI18_R1.fastq.gz --file2 /workdir/jlw395/Gray_WI18_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_WI18
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Mix_WI16_R1.fastq.gz --file2 /workdir/jlw395/Mix_WI16_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Mix_WI16
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Gray_IL15_R1.fastq.gz --file2 /workdir/jlw395/Gray_IL15_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_IL15
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Mix_WI14_R1.fastq.gz --file2 /workdir/jlw395/Mix_WI14_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Mix_WI14
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Gray_IL10_R1.fastq.gz --file2 /workdir/jlw395/Gray_IL10_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_IL10
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_IA3_R1.fastq.gz --file2 /workdir/jlw395/Ruf_IA3_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_IA3
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Gray_WI27_R1.fastq.gz --file2 /workdir/jlw395/Gray_WI27_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_WI27
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Gray_WI26_R1.fastq.gz --file2 /workdir/jlw395/Gray_WI26_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_WI26
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_IL25_R1.fastq.gz --file2 /workdir/jlw395/Ruf_IL25_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_IL25
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Gray_IL24_R1.fastq.gz --file2 /workdir/jlw395/Gray_IL24_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Gray_IL24
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_IL22_R1.fastq.gz --file2 /workdir/jlw395/Ruf_IL22_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_IL22
/programs/adapterremoval_2.1.1/bin/AdapterRemoval --file1 /workdir/jlw395/Ruf_WI21_R1.fastq.gz --file2 /workdir/jlw395/Ruf_WI21_R2.fastq.gz --trimns --trimqualities --minquality 35 --minlength 25 --collapse --threads 8 --adapter-list for_adapter_removal_2.txt --basename Ruf_WI21
