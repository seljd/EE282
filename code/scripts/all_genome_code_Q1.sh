#!/usr/bin/env bash
#
# EcoEvo 282 Homework 3
# Junyan Duan
# 11/8/2020
#
# get the data and perform the analysis
geno_assemurl="ftp://ftp.flybase.net/genomes/dmel/current/fasta/dmel-all-chromosome-r6.36.fasta.gz"
wget -O - -q $geno_assemurl \
| tee data/raw/dmel-all-chromosome-r6.36.fasta.gz \
| gunzip -c \
| faSize /dev/stdin \
> data/processed/dmel_all_chromosome.unsorted.highlevelSum.txt
md5sum data/raw/dmel-all-chromosome-r6.36.fasta.gz > output/reports/dmel-all-chromosome-r6.36_checksum.txt
