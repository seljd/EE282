#!/usr/bin/env bash

faSize -detailed data/processed/unitigs.fa \
| sort -rnk 2,2 \
| tee data/processed/unitigs.sorted.namesizes.txt \
| cut -f 2 \
> data/processed/unitigs.sorted.sizes.txt

r6url="https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/215/GCA_000001215.4_Release_6_plus_ISO1_MT/GCA_000001215.4_Release_6_plus_ISO1_MT_genomic.fna.gz"

wget -O - -q $r6url \
| tee data/raw/ISO1.r6.scaff.fa.gz \
| gunzip -c \
| tee >(faSize -detailed /dev/stdin \
        | sort -rnk 2,2 \
        | tee data/processed/ISO1.r6.scaff.sorted.namesizes.txt \
        | cut -f 2 \
        > data/processed/ISO1.r6.scaff.sorted.sizes.txt) \
| faSplitByN /dev/stdin /dev/stdout 10 \
| tee >(gzip -c > data/raw/ISO1.r6.ctg.fa.gz) \
| faSize -detailed /dev/stdin \
| sort -rnk 2,2 \
| tee data/processed/ISO1.r6.ctg.sorted.namesizes.txt \
| cut -f 2 \
> data/processed/ISO1.r6.ctg.sorted.sizes.txt

plotCDF data/processed/*.sizes.txt /dev/stdout \
| tee output/figures/CDF.png \
| display
