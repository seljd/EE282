#!/usr/bin/env bash

MinIONreads=https://hpc.oit.uci.edu/~solarese/ee282/iso1_onp_a2_1kb.fastq.gz

raw=data/raw
processed=data/processed
figures=output/figures
reports=output/reports

wget -O - -q $MinIONreads > $raw/reads.fq
minimap -t 32 -Sw5 -L100 -m0 $raw/reads.fq{,} \
| gzip -1 \
> $processed/onp.paf.gz

miniasm -f $raw/reads.fq $processed/onp.paf.gz \
> $processed/reads.gfa

n50 () {
  bioawk -c fastx ' { print length($seq); n=n+length($seq); } END { print n; } ' $1 \
  | sort -rn \
  | gawk ' NR == 1 { n = $1 }; NR > 1 { ni = $1 + ni; } ni/n > 0.5 { print $1; exit; } '
}

awk ' $0 ~/^S/ { print ">" $2" \n" $3 } ' $processed/reads.gfa \
| tee >(n50 /dev/stdin > $reports/n50.txt) \
| fold -w 60 \
> $processed/unitigs.fa
