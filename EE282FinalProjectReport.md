# Investigating the Circadian Rhythms in Neurons and Ependymal Cells 
Junyan Duan  
EcoEvo 282 Final Project Report  
12/13/2020  
## Introduction
The circadian clock is a biochemical oscillator that controls organisms’ internal rhythms so that they are synchronized with the light/dark cycle with a period of around 24 hours. In mammals, the rhythm is decided by a small region in the hypothalamus called suprachiasmatic nucleus (SCN), which are a group of neurons that send signals to establish clocks in peripheral tissues. Since the core clock gene network plays important roles in many fundamental physiological processes, such as cell proliferation and metabolism, dysfunction of the circadian clock can lead to worse clinical outcome and can even cause metabolic diseases [Vlachou 2019]. As the circadian clock is involved in abundant aspects of organisms’ biology, understanding more about the clock, both in and out of the SCN, is critical.    
In the paper, *Spatiotemporal single-cell analysis of gene expression in the mouse suprachiasmatic nucleus*, Wen et al. performed Drop-seq (single-cell RNA-seq) on samples collected at regions around mouse SCN every four hours for 44 hours to generate a single-cell RNA-seq timeseries dataset [Wen 2019]. Since other cell types around the SCN are also collected in the sample, they were able to compare the expression of core clock genes in different cell types. Interestingly, the populational expression level of core clock genes differ greatly in different cell types. For example, the amplitude of expression levels of some core clock genes in ependymal cells is greater than in neurons. Since this observation is based on expression levels averaged at the cell-type level, the cause behind this difference is unclear: It can be that the gene expression level is lower in every single neuron, or it can be that the amplitude in every neuron is as high as in ependymal cells, but the neurons are not as synchronized, creating dampened amplitudes when we take the population average.   
In this report, I tested two methods that may give some preliminary insights into which of the two scenarios mentioned above causes the differences in clock gene expression amplitudes in ependymal cells and neurons. The first one involves looking at the spaghetti plot of gene expressions, while the second one looks at the cell-type level expression correlations between pairs of different core clock genes.  

## Methods
The raw data can be downloaded [here](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE117295). However, since I am also using this dataset for my current research project with Dr. Bogi Andersen and Dr. John Lowengrub, I have already performed clustering on this dataset using the `Seurat` package in `RStudio` and decided cell types for the clusters by plotting expression levels of marker genes in feature plots. Hence, for this final project, I started with the labeled `Seurat` object and focused on the ependymal cells and neurons. The labeled `Seurat` object can be found in my google drive [here](https://drive.google.com/drive/folders/1PtoOpW8LOpGUUgLlvnHCEVdXziSUgyc6?usp=sharing).  
<p float="left">
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/scn.whole.tsne.with.names.jpeg" width="450" />
</p>

The first step is to get the expression of some core clock genes from the `Seurat` object. I decided to focus on the genes that are found to show rhythmic expressions in [Wen 2019], and a few additional core clock genes. In the end, the core clock genes included in the analysis in this report are *Arntl*, *Clock*, *Npas2*, *Per1*, *Per2*, *Per3*, *Cry1*, *Nr1d1*, *Nr1d2*, *Rora*, *Rorb*, *Dbp*, *Nfil3*, *Tef*, *Hlf*, *Bhlhe41* and *Ciart*. I used the `FetchData` function to get and store information about cell type, circadian time, sample batch and expression levels of the core clock genes mentioned above in columns. Rows of this data frame are cells. Note that at this point all the cells in the dataset are in the data frame. Then for each gene, I scaled the expression levels, so they are between 0 and 1, with the highest level adjusted to be 1 and lowest adjusted to be 0. Since all the cell types are scaled together, it is reasonable to compare between different cell types. I call this data frame `clock.expression` in my code.  

### Spaghetti plots
It would be nice if we could keep track of cells in the single-cell RNAseq data. However, since at different time points different mice are sacrificed for sampling, the single-cell RNAseq data is not a true timeseries. To capture more information than averaging the entire cell type population, I randomly selected 50 cells from the same cell type at the same time point and took the average. Then the average of the 50 cells at individual time points are connected to form a line-graph. Since there are in total 12 time points in the data, in the end one line-graph involves 600 cells. I call those 600 cells a group. Then the process is repeated with replacement to generate 50 groups, which will give 50 lines in the spaghetti plot.  
I wrote a function called `spaghettiTime` that does the exact steps described above. It requires several inputs. `cell.type` defines the cell type to look at; `ct` defines the time points; `gene.list` defines the genes to focus on; `cell.group.max` defines the number of cell groups; And `cell.per.group` defines the number of cells to randomly draw at each time point for each group. The output of this function contains two matrices: `clock.gene.ct.matrix`, which contains the average values needed for the spaghetti plots, and `clock.random.sample`, which contains all the cells selected in the random draw. The random samples used in this report generated from `spaghettiTime` are saved at `data/processed/spaghettiresults_ependymal.RData` and `data/processed/spaghettiresults_neurons.RData`. 

### Correlation test
For Pearson's correlation tests between different core clock genes, the inputs are the average values of the lines in the spaghetti plots (which is `clock.gene.ct.matrix`). The expression levels of the genes in the input are first tested to see whether they are normally distributed using the `shapiro.test`. If not, then that gene is excluded from the correlation test, since the data being normally distributed is an assumption of the test. For simplicity, I assumed that core clock gene expression levels are linearly related to each other. The results of the correlation tests between viable genes are plotted in correlation plots. 

## Results

### Spaghetti plots
I picked three genes to plot in spaghetti plots for both ependymal cells and neurons: *Arntl*, *Per2* and *Dbp*.  In each figure, the blue lines are the cell groups discussed in the method section and the pink dots are the random cells involved in those blue lines. Note that the pink dots are allowed to be on top of each other. There are pink dots with very high expression level, but the blue lines stay in the low value region. This is because of the massive number of dropouts in the original dataset, which is the nature of single-cell RNAseq data. Those dropouts cause many cells to have 0 expression level and thus when averaged with cells with high expression level, the results are low.  
<p float="left">
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/epen_Arntl.png" width="300" />
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/epen_per2.png" width="300" /> 
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/epen_Dbp.png" width="300" />
</p>
<p float="left">
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/neu_Arntl.png" width="300" />
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/neu_per2.png" width="300" /> 
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/neu_Dbp.png" width="300" />
</p>

To see the pattern formed by the spaghetti lines, a zoomed in version of the plots without the pink dots are also generated.  
<p float="left">
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/epen_arntl_line.png" width="300" />
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/epen_per2_line.png" width="300" /> 
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/epen_dbp_line.png" width="300" />
</p>
<p float="left">
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/neu_arntl_line.png" width="300" />
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/neu_per2_line.png" width="300" /> 
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/neu_dbp_line.png" width="300" />
</p>

From those figures, we see that the expression of *Dbp* is more synchronized and has higher peak level in ependymal cells than in neurons. The same goes to expression of *Arntl*. Also for both of the genes, the distribution of the non-zero pink dots are wider in neurons than in ependymal cells, which is another indication that the neurons are less synchronized, as we would expect that in a synchronized cell population, the expression level would peak and trough at the same time, to form relatively narrow expression distributions at the peak and trough time points. On the other hand, the expression of *Per2* in neither ependymal cells nor neurons form strong circadian patterns, with the neurons spaghetti lines appearing to be more rhythmic than the ependymal cells.   

### Correlation test
Since the core clock gene network is well-documented, looking into how well the time-series expression level of those genes correlate with each other according to the standard network may give some insights into why the rhythm is stronger in the ependymal cells than in the neurons. It is reasonable to expect that a more synchronized population would yield stronger correlations between expression patterns of different genes. The averages of the spaghetti lines for some of the core clock genes are plotted below. The correlation test uses the values shown in these two figures are inputs. 

<p float="left">
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/epen_avg.png" width="400" />
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/neu_avg.png" width="400" /> 
</p>

The results of correlation test for ependymal cells and neurons are shown in the correlation plots. Since the genes whose expression distributions are not normal are excluded in the test, the genes involved in the correlation tests for the two cell types are different. Blue represents positive correlation, which means one increases as the other increases, while red represents negative correlation, which means one decreases as the other increases. Non-significant correlations are crossed out and the p-value cut off is 0.05.  
<p float="left">
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/epen_cor.png" width="450" />
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/neu_cor.png" width="400" /> 
</p> 

Since different genes are included in the two cell types, it is only fair to compare the correlations between genes that show up in correlation plots for both cell types. Below is the cleaned-up version of the correlation plot for both ependymal cells and neurons. The number of non-significant correlations between pairs of genes are similar in the two cell types (23 in ependymal cells and 22 in neurons). Interestingly, some of the negative expression correlations between *Clock*, *Nfil3* and other genes are only significant in the ependymal cells.
<p float="left">
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/epen_cor_sig.png" width="450" />
  <img src="https://github.com/seljd/ee282/blob/final-report/output/figures/neu_cor_sig.png" width="400" /> 
</p>

## Discussion
In this report, I used two different methods to explore the possible cause behind the differences in amplitude of core clock gene expressions in ependymal cells and neurons.  
By looking at the spaghetti plots, it may appear that the core clock gene expressions in ependymal cells are more synchronized than in neurons. Also, for some genes the expression levels are higher in ependymal cells at peak time points. However, this does not mean that the cause of higher cell-type level expression in ependymal cells is more synchronized gene expression at a higher level: I need to look at more genes to draw a more tenable conclusion, as the patterns may be different when I look at different genes. The spaghetti plots for *Dbp*, *Artnl* and *Per2* are already different from each other.   
By looking at the correlation plots, it is really hard to draw a conclusion: more pairs of genes show significant correlations in neurons but the negative correlations we expect to see are only significantly present in ependymal cells. Also, since the input data is based on the average of randomly chosen cells, the results of the correlation tests will change in a different run. One way to make a more solid argument is to repeat the correlation test many times on different sets of random ependymal cells and neurons, and then compare the results from those runs. Besides this, my assumption of linear relationship between the expression levels of core clock genes needs to be verified as well.   
In summary, based on the analysis done in this report, though it looks like that more synchronized expressions at a higher level is the cause behind the difference in amplitudes of clock gene expressions in ependymal cells and neurons, more analyses need to be done to achieve a tenable conclusion. 

## References
Vlachou, D., Bjarnason, G. A.,  … Rand, D. A. (2019). TimeTeller: a New Tool for Precision Circadian Medicine and Cancer Prognosis. BioRxiv. <https://doi.org/10.1101/622050>.  
Wen, S., Ma, D., … Yan, J. (2020). Spatiotemporal single-cell analysis of gene expression in the mouse suprachiasmatic nucleus. Nature Neuroscience. <https://doi.org/10.1038/s41593-020-0586-x>.  
Stuart T, Butler A, Hoffman P, Hafemeister C, Papalexi E, III WMM, Hao Y, Stoeckius M, Smibert P, Satija R (2019). “Comprehensive Integration of Single-Cell Data.” Cell. <https://doi.org/10.1016/j.cell.2019.05.031>.
