# EcoEvo 282 Homework 3
Junyan Duan  
11/8/2020  

The following code was used to set up the project and directory

```
createProject homework3 ~/classrepos/     
cd ~/homework3/
```

## Problem 1: Summarize Genome Assembly
The code file for answering this question is at `code/scripts/all_genome_code_Q1.sh`. 
### File Integrity
The checksum generated for the downloaded file using `md5sum` is **fbd2855a20c3610050ff2496dd975821**, which is the same as the one given in `md5sum.txt` [here](ftp://ftp.flybase.net/genomes/dmel/current/fasta/md5sum.txt). This checksum is saved at `output/reports/dmel-all-chromosome-r6.36_checksum.txt`.
### Calculate summaries of the genome
After running the code file `code/scripts/all_genome_code_Q1.sh`, I found that there are **143726002 bases**, **1152978 Ns** and **1870 sequences**. Refer to file `data/processed/dmel_all_chromosome.unsorted.highlevelSum.txt` for the output of `faSize`.  
## Problem 2: Summarize an Annotation File
The code file for answering this question is at `code/scripts/annota_Q1Q2_code.sh`. 
### File Integrity
The checksum generated for the downloaded file using `md5sum` is
**9085d2f3d2449fc1f6159015511240b8**, which is the same as the one given in `md5sum.txt` [here](ftp://ftp.flybase.net/genomes/dmel/current/gtf/md5sum.txt). This checksum is saved at `output/reports/dmel-all-r6.36_checksum.txt`.
### Compile a Report Summarizing the Annotation
* After running the code file `code/scripts/annota_Q1Q2_code.sh`, I obtained the following result for the total number of features of each type: 

```
189268 exon
 162578 CDS
  46664 5UTR
  33629 3UTR
  30812 start_codon
  30754 stop_codon
  30728 mRNA
  17875 gene
   3047 ncRNA
    485 miRNA
    366 pseudogene
    312 tRNA
    300 snoRNA
    262 pre_miRNA
    115 rRNA
     32 snRNA
```
The result is stored at `output\reports\dmel-all-r6.36_features_count.txt`.  

* Since the quetion only asks for the number of genes, I used `awk` to filter out the genes. The code file `code/scripts/annota_Q1Q2_code.sh` (used above) also gives the total number of genes per chromosome arm:

```
4225 3R
3653 2R
3516 2L
3486 3L
2691 X
 114 4
 113 Y
```
The result is stored at `output\reports\dmel-all-r6.36_gene_per_chromo_count.txt`.  

