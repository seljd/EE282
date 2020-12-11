#!/usr/bin/env bash

gunzip -c data/raw/ISO1.r6.scaff.fa.gz > data/raw/Dmel_scaff.fa
busco -c 18 -i data/raw/Dmel_scaff.fa -l diptera_odb10 -o Dmel_busco_scaff -m genome

gunzip -c data/raw/ISO1.r6.ctg.fa.gz > data/raw/Dmel_ctg.fa
busco -c 18 -i data/raw/Dmel_ctg.fa -l diptera_odb10 -o Dmel_busco_ctg -m genome

