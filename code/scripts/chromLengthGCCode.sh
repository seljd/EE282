bioawk -c fastx '{ print $name, length($seq), gc($seq) }' < data/processed/dmel-all-chromosome-r6.36_sml100.fasta.gz >output/reports/sml100length.txt

bioawk -c fastx '{ print $name, length($seq), gc($seq) }' < data/processed/dmel-all-chromosome-r6.36_grt100.fasta.gz >output/reports/grt100length.txt
