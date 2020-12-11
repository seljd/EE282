# EE282 Homework 4
Junyan Duan
12/6/2020

## Summarize partitions of a genome assembly
### Calculate the following for all sequences ≤ 100kb and all sequences > 100kb:
The code for this section is in `code/scripts/sumCode.sh`.  

* For all sequences ≤ 100kb  
There are **6178042 nucleotides, 662593 N's and 1863 sequences** in the sequences ≤ 100kb. The output of `faSize` is in `output/reports/sml100faSize.txt`.  
* For all sequences > 100kb  
There are **137547960 nucleotides, 490385 N's and 7 sequences** in the sequences > 100kb. The output of `faSize` is in `output/reports/grt100faSize.txt`.


### Plots of the following for for all sequences ≤ 100kb and all sequences > 100kb:
The code for getting sequences length and GC percentage is `code/scripts/chromLengthGCCode.sh`. The outputs of this step are saved as `output/reports/sml100length.txt` and `output/reports/grt100length.txt`. 

* Sequence length distribution. Use a histogram!  
This plot is done using `Rstudio`, the markdown file is `ee282Homework4Rnotebook.Rmd`. Plots are saved at `/output/figures`.
![Alt text](https://github.com/seljd/ee282/blob/homework4/output/figures/smlSeqLength.png)
* Sequence GC% distribution. Use a histogram!  
This plot is done using `Rstudio`, the markdown file is `ee282Homework4Rnotebook.Rmd`. Plots are saved at `/output/figures`.
* Cumulative sequence size sorted from largest to smallest sequences.  
The code used to generate this plot is `/code/scripts/plotsCode.sh`. Plots are saved at `/output/figures`.

## Genome Assembly
### Assemble a genome from MinION reads
The code for this task is `code/scripts/miniCode.sh`. The output is saved as `data/processes/unitigs.fa`. However, when I tried to upload the file to github, it says the file is too big. 
### Assembly assessment
* Calculate the N50 (Links to an external site.) of your assembly.  
N50 is calculated to be **4494246**, which is much smaller than the contig N50 given in the database, which is 21485538. The code for this is `code/scripts/miniCode.sh`. Output is saved at `output/reports/n50.txt`. 
* Compare your assembly to both the contig assembly and the scaffold assembly from the Drosophila melanogaster on FlyBase using a contiguity plot.  
The code for this task is `code/scripts/assemplot.sh`. The figure is save as `output/figures/CDF.png`. The top dashed line is the scaffold assembly, the middle solid line is for the contig assembly, and the bottom dotted line is for the assembly of MinION reads. 
* Calculate BUSCO scores (Links to an external site.) of both assemblies and compare them. You can obtain the BUSCOs pipeline from conda.  
The code for this task is `code/scripts/BUSCO.sh`. I deleted the output of those two files for more space. 
For both the release 6 scaffold and contig assembly, the BUSCO complete score is **99.5%**. S is 99.1%, D is 0.4%, F is 0.2% and M is 0.3%.  
For the MinION read assembly, the BUSCO complete score is **0.2%**. S is 0.2%, D is 0%, F is 2% and M is 97.8%. 
