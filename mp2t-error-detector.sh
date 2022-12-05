#!/bin/bash
infile=$1
name=${infile%%[0-9]*.pcap}
size=${name}
date=${infile:size}
outfile=$name"drops_"$date
echo "Processing "$infile
tshark -r $infile -w $outfile -F pcap -Y "mp2t.analysis.drops"
echo
echo "Completed, Output written to "$outfile
echo
