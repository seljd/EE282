#!/usr/bin/env bash
#
# EcoEvo 282 Homework 3
# Junyan Duan
# 11/8/2020
#
annota_url="ftp://ftp.flybase.net/genomes/dmel/current/gtf/dmel-all-r6.36.gtf.gz"
wget -O - -q $annota_url \
| tee data/raw/dmel-all-r6.36.gtf.gz \
| gunzip -c \
| cut -f 3 \
| sort \
| uniq -c \
| sort -rnk 1,1 \
> output/reports/dmel-all-r6.36_features_count.txt
md5sum data/raw/dmel-all-r6.36.gtf.gz>output/reports/dmel-all-r6.36_checksum.txt
#
# q2
gunzip -c data/raw/dmel-all-r6.36.gtf.gz \
| awk '$3 == "gene"' \
| tee data/processed/dmel-all-r6.36_just_genes.txt \
| cut -f 1 \
| sort \
| uniq -c \
| sort -rnk 1,1 \
| grep -E '\<[2,3,4,X,Y]' \
| grep -E '[R,L,X,Y,4]$' \
| grep -E '\<[^211]' \
> output/reports/dmel-all-r6.36_gene_per_chromo_count.txt
