gunzip -c data/processed/dmel-all-chromosome-r6.36_sml100.fasta.gz \
| faSize -detailed /dev/stdin \
| sort -rnk 2,2 \
| tee data/processed/dmel-all-chromosome-r6.36_sml100.sorted.namesizes.txt \
| cut -f 2 \
> data/processed/dmel-all-chromosome-r6.36_sml100.sorted.sizes.txt

plotCDF data/processed/*sml100.sorted.sizes.txt /dev/stdout \
> output/figures/sml100CDF.png 


gunzip -c data/processed/dmel-all-chromosome-r6.36_grt100.fasta.gz \
| faSize -detailed /dev/stdin \
| sort -rnk 2,2 \
| tee data/processed/dmel-all-chromosome-r6.36_grt100.sorted.namesizes.txt \
| cut -f 2 \
> data/processed/dmel-all-chromosome-r6.36_grt100.sorted.sizes.txt

plotCDF data/processed/*grt100.sorted.sizes.txt /dev/stdout \
> output/figures/grt100CDF.png 
