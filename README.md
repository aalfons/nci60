# NCI-60 cancer cell panel

The original data were downloaded from [https://discover.nci.nih.gov/cellminer/] on January 27, 2012. We downloaded the following two data sets:

1. Gene expression data obtained with an Affymetrix HG-U133(A-B) chip set and normalized with the GCRMA method.
2. Protein expressions based on antibodies, acquired via reverse-phase protein lysate arrays and log2 transformed.

The file `nci60.RData` contains the processed data as used in our article:

[Alfons, Croux &amp; Gelper (2013). Sparse least trimmed squares regression for analyzing high-dimensional large data sets. *Annals of Applied Statistics*, 7(1): 226-248.](https://doi.org/10.1214/12-AOAS575)

The code for processing the data is given in file `process_data.R`.
