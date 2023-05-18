#EASO Project
#Jen Walsh, March 2023
#Mapping raw reads to reference genomes

#samtools align to ref genome

#load your sample names into an array.
#in this example I will get the sample names from the adapter removal files I generated after a previous step.

##Going to do this with two reference genomes. The WCSP and the GRSP, both from NCBI

##First with WCSP (White-crowned sparrow)
bowtie2-build -f /workdir/jlw395/Masio_pseudohap2.1.fasta EASOindex

## this was done on medium 40 core machine -- and bowtie2 step completed about 19 individuals per day ##
## samtools sort was the limiting factor -- increasing RAM makes it faster
## there were issues with some files not finishing sorting -- would have to kill them and restart...still not sure why this happens
## I used this script for all samples excep the Berkeley birds (see next section below)
mkdir /workdir/jlw395/align

INDS=($(for i in /workdir/jlw395/*.settings; do echo $(basename -s .settings $i); done))
#basename - will remove the directory path and returns the file name. -s tell it which suffix to remove from the end of the file name (in this case .settings)
#note: the variable INDS will now contain an array of the sample names extracted from the files names.

#If you want to see what is stored in this variable you can type:
#echo ${INDS[@]}
#@=all the elements in the array

########################################
#######################################
#Using modified loop to map files and pipe to a bam file and then use sambamba. It is just way more efficient to sort this way

REFERENCE=EASOindex

[ -f /workdir/jlw395/align/bowtie2Commands.txt ] && rm /workdir/jlw395/align/bowtie2Commands.txt

for SAMPLEID in ${INDS[@]}; do
  #declare variables. This makes it easier and neater to write your command line and you just have to change these for future projects.
  ONESEQ=/workdir/jlw395/${SAMPLEID}.pair1.truncated
  TWOSEQ=/workdir/jlw395/${SAMPLEID}.pair2.truncated
  USEQ=/workdir/jlw395/${SAMPLEID}.collapsed,/workdir/jlw395/${SAMPLEID}.collapsed.truncated,/workdir/jlw395/${SAMPLEID}.singleton.truncated
  OUTPUT=/workdir/jlw395/align/${SAMPLEID}.bam

  # align with bowtie - the output is piped directly into samtools to avoid having the intermediate .sam file.
  echo "Aligning $SAMPLEID with bowtie"
  #this just writes a line telling you which sample is being worked on.
  echo "bowtie2 -p 8 --phred33 --very-sensitive-local -x $REFERENCE -I 149 -X 900 --rg-id $SAMPLEID --rg SM:$SAMPLEID -1 $ONESEQ -2 $TWOSEQ -U $USEQ|samtools view -bS > $OUTPUT" >> /workdir/jlw395/align/bowtie2Commands.txt

done

parallel -j 4 < /workdir/jlw395/align/bowtie2Commands.txt

##Going to use sambamba to sort
#https://www.basepairtech.com/blog/sorting-bam-files-samtools-vs-sambamba/
# loop for Sambamba sort
[ -f /workdir/jlw395/align/SambambaSortCommands.txt ] && rm /workdir/jlw395/align/SambambaSortCommands.txt

cd /workdir/jlw395/align/

for BAM in *.bam; do
  OUT=/workdir/jlw395/align/${BAM}_sorted.bam

  #create sort file
  echo "/programs/sambamba-0.7.1/sambamba sort -t 30 -m 45G -o $OUT $BAM" >> /workdir/jlw395/align/SambambaSortCommands.txt

done

parallel -j 4 < /workdir/jlw395/align/SambambaSortCommands.txt


# qualimap for loop
# may have to increase mem limit:
#/programs/qualimap_v2.2.1/qualimap bamqc -bam SAMPLE.bam --java-mem-size=30G -outfile SAMPLE.sorted.pdf

[ -f /workdir/jlw395/align/qualimapCommands.txt ] && rm /workdir/jlw395/align/qualimapCommands.txt

cd /workdir/jlw395/align/

for BAM in *.bam; do

  #string replacement command
  PDF=${BAM/%.bam/.pdf}
  # qualimap
  echo "/programs/qualimap_v2.2.1/qualimap bamqc -bam $BAM -outfile $PDF --java-mem-size=128G" >> /workdir/jlw395/align/qualimapCommands.txt

done

parallel -j 4 < /workdir/jlw395/align/qualimapCommands.txt


# to run and get log output:
# bash qualimap.sh 2>&1 | tee qualimap_may1_$(date +%Y%m%d-%Hh%Mm%Ss).log
