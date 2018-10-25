# Make ROI BED Script

## Introduction

A script to make the gene specific Region of Interest (ROI) BED files for the TruSightOneCancer Panel.

The need for this files is to create a BEd file which describes the capture regions that are present within a specific transcript.

The output of the script will be a BED file with the caputure ROI as the first three columns and the forth being a description of the exon that region intersects.

Please read SOP before running this script.

## Requirements

- Tested on Linux and MacOS - should work on any standard UNIX system.

- bedtools installed and added to path. Either add to path or change the $BEDTOOLS variable in the script to the install location.

## Run

Download the latest version of the script.

Within a terminal type:

`bash make_roi_bed.sh $TRANSCRIPT_ID $GENE_MODEL $CAPTURE_BED`

For example:

`bash make_roi_bed.sh ENST00000397752 Homo_sapiens.GRCh37.87.gff3 IlluminaTruSightCancer_ROI_b37.bed MET > MET.bed`

Note that the script assumes that bedtools is in your path. Either add it or edit the script if this is not the case.

## Testing

Previous to this script the BED files were made manually on the command line using bedtools.

The output of the script was compared with five of these BED files to check that it produced identical output.

The location of the testing files can be found at: /data/results/in_house_tool_validations/make_roi_bed/

The location of the BEDs used by the pipeline can be found at: /data/diagnostics/pipelines/GermlineEnrichment/GermlineEnrichment-{version}/IlluminaTruSightCancer/hotspot_coverage

