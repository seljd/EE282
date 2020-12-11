chrom=ftp://ftp.flybase.net/genomes/dmel/current/fasta/dmel-all-chromosome-r6.36.fasta.gz
wget -O - -q $chrom > data/raw/dmel-all-chromosome-r6.36.fasta.gz

bioawk -cfastx '{ if(length($seq) <= 100000) { print ">"$name; print $seq }}' data/raw/dmel-all-chromosome-r6.36.fasta.gz \
| gzip -c \
> data/processed/dmel-all-chromosome-r6.36_sml100.fasta.gz
faSize data/processed/dmel-all-chromosome-r6.36_sml100.fasta.gz > output/reports/sml100faSize.txt

bioawk -cfastx '{ if(length($seq) > 100000) { print ">"$name; print $seq }}' data/raw/dmel-all-chromosome-r6.36.fasta.gz \
| gzip -c \
> data/processed/dmel-all-chromosome-r6.36_grt100.fasta.gz
faSize data/processed/dmel-all-chromosome-r6.36_grt100.fasta.gz > output/reports/grt100faSize.txt

