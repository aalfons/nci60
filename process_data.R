# ----------------------
# Author: Andreas Alfons
#         KU Leuven
# ----------------------


## I downloaded the zip-files from https://discover.nci.nih.gov/cellminer/.
## It's a bit confusing in the code below that the subfolder and the text file
## containing the data have the same name, but I just unzipped the downloaded
## zip-files and that's what I got.  I didn't want to rename the original
## files.


## load and process protein expression data
# load data
path_protein <- "nci60_Protein__Lysate_Array_log2.txt"
file_protein <- "nci60_Protein__Lysate_Array_log2.txt"
protein <- read.table(paste(path_protein, file_protein, sep = "/"),
                      sep = "\t", skip = 1)
# remove some descriptive columns, then transpose because the cancer cell lines
# are stored in columns instead of rows
protein <- t(as.matrix(protein[, -(1:4)]))
rownames(protein) <- 1:nrow(protein)

## load and prepare gene expression data
# load data
path_RNA <- "nci60_RNA__Affy_HG_U133(A_B)_GCRMA.txt"
file_RNA <- "nci60_RNA__Affy_HG_U133(A_B)_GCRMA.txt"
x <- read.table(paste(path_RNA, file_RNA, sep = "/"),
                sep = "\t", na.strings = "-", skip = 1)
# only keep rows that correspond to the Affymetrix HG-U133A chip
keep <- x[, 1] == "RNA: Affy HG-U133(A) GCRMA"
x <- x[keep, ]
# remove some descriptive columns, then transpose because the cancer cell lines
# are stored in columns instead of rows
x <- t(as.matrix(x[, -(1:4)]))
rownames(x) <- 1:nrow(x)

## gene expression data contains one observation with only NAs, so remove it
remove <- which(apply(is.na(x), 1, all))
protein <- protein[-remove, ]
x <- x[-remove, ]

## save data to RData file
save(protein, x, file = "nci60.RData")
