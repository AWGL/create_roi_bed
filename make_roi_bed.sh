#!bin/bash
set -euo pipefail

# The purpose of this script is to create a BED file of the capture regions that fall within a given transcript.
# Usage is as follows:
# bash make_roi_bed.sh $TRANSCRIPT_ID $GENE_MODEL $CAPTURE_BED $GENE_NAME
# For example: bash make_roi_bed.sh ENST00000397752 Homo_sapiens.GRCh37.87.gff3 IlluminaTruSightCancer_ROI_b37.bed MET > MET.bed
# Output is written to stdout
# Adds an annotation of in the 4th BED column showing the exon that the capture region intersects
# Get gene model file from http://ftp.ensembl.org/pub/grch37/release-87/gff3/homo_sapiens/Homo_sapiens.GRCh37.87.gff3.gz

if [ -z "$1" ]
  then
    echo "No Transcript ID argument provided e.g. ENST00000397752."
    exit 1
fi


if [ -z "$2" ]
  then
    echo "No gene model file provided e.g. Homo_sapiens.GRCh37.87.gff3"
    exit 1
fi

if [ -z "$3" ]
  then
    echo "No capture region BED provided e.g. IlluminaTruSightCancer_ROI_b37.bed "
    exit 1
fi

if [ -z "$4" ]
  then
    echo "No gene name provided e.g. MET"
    exit 1
fi

# Declare variables

TRANSCRIPT_ID=$1
GENE_MODEL=$2
CAPTURE_BED=$3
GENE_NAME=$4

#Where is bedtools?

BEDTOOLS=bedtools

#Make the bed
grep $TRANSCRIPT_ID $GENE_MODEL | grep exon | $BEDTOOLS intersect -a $CAPTURE_BED -b - -wa -wb | awk -v gene_name="${GENE_NAME}" 'BEGIN { OFS="\t" } {print $1,$2,$3,gene_name".chr"$1"."$7"."$8}'