# EcoEvo 282 Project Analysis Proposal
Junyan Duan  
10/30/2020

----  
The circadian rhythm that synchronizes with the light/dark cycle in organisms is controlled by an internal biochemical oscillator. In mammals, the circadian rhythm is not only present in the brain, in which it is controlled by suprachiasmatic nucleus (SCN), but also well-established everywhere else in the body. Because the core clock gene network is an important regulator of many fundamental physiological processes, disruption of the circadian rhythm often worsens clinical outcome or even causes metabolic diseases. Hence, understanding more about the circadian rhythm both in and out of the SCN is important [Vlachou 2019]. 

In the paper, *Spatiotemporal single-cell analysis of gene expression in the mouse suprachiasmatic nucleus*, Wen et al. performed Drop-seq (single-cell RNA-seq) on tissues containing the SCN every four hours for 44 hours, creating a time-series sequencing dataset. The dataset is located at the Gene Expression Omnibus Database and can be easily downloaded as a `.tar` file [here](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE117295). 

Because the samples contain cells around SCN as well, multiple cell types were picked up in the dataset. According to the paper [Wen 2019], ependymal cells express stronger circadian rhythm (higher amplitude) than the neurons. With the core clock gene network and the feedback loops well-documented by previous studies, it is possilbe to look at the time-series expression level of those core clock genes to see how well they correlate with each other according to the standard network. Investigating this may be helpful to understand why the rhythm is stronger in the ependymal cells than in the neurons, as it is reasonable to expect that a more synchronized population would yield stronger circadian rhythm as well as stronger correlations between expression patterns of the different genes.

To separate out the ependymal cells and the neurons in the dataset, I plan to use the `Seurat` package in `R` and follow [this tutorial](https://satijalab.org/seurat/v3.2/pbmc3k_tutorial.html) [Stuart 2019]. `FeaturePlot` plotting expression level of marker genes will be used to determine cell types. Unfortunately, it is simply impossible to keep track of cells in the scRNA-seq time-series data, as different mice and cells are involved at different rounds of sequencing. Hence, to still capture more information than just taking the average of the entire cell type population, I plan to randomly select some cells from the same cell type at each timestep and take the average. This step can be repeated several times with replacement and the resulting time-series data can be plotted as spaghetti plots. To study the correlation, I will take the average of the curves in the spaghetti plots and perform correlation tests. The results will then be shown in correlation plots. All of the analysis will be performed in `RStudio`.

It may sound like a lot, but since I am using this dataset for my current research, I already have processed the dataset to some extent. I also already know how to do correlation tests and plot correlation plots. I expect the coding intensive part to be the random sampling process for the spaghetti plots. 

----
### References:
Vlachou, D., Bjarnason, G. A.,  … Rand, D. A. (2019). TimeTeller: a New Tool for Precision Circadian Medicine and Cancer Prognosis. BioRxiv. <https://doi.org/10.1101/622050>.  
Wen, S., Ma, D., … Yan, J. (2020). Spatiotemporal single-cell analysis of gene expression in the mouse suprachiasmatic nucleus. Nature Neuroscience. <https://doi.org/10.1038/s41593-020-0586-x>.  
Stuart T, Butler A, Hoffman P, Hafemeister C, Papalexi E, III WMM, Hao Y, Stoeckius M, Smibert P, Satija R (2019). “Comprehensive Integration of Single-Cell Data.” Cell. <https://doi.org/10.1016/j.cell.2019.05.031>.


