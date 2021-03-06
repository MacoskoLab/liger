% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rliger.R
\name{read10X}
\alias{read10X}
\title{Read 10X alignment data (including V3)}
\usage{
read10X(
  sample.dirs,
  sample.names,
  merge = TRUE,
  num.cells = NULL,
  min.umis = 0,
  use.filtered = FALSE,
  reference = NULL,
  data.type = "rna",
  verbose = TRUE
)
}
\arguments{
\item{sample.dirs}{List of directories containing either matrix.mtx(.gz) file along with genes.tsv,
(features.tsv), and barcodes.tsv, or outer level 10X output directory (containing outs directory).}

\item{sample.names}{Vector of names to use for samples (corresponding to sample.dirs)}

\item{merge}{Whether to merge all matrices of the same data type across samples or leave as list
of matrices (default TRUE).}

\item{num.cells}{Optional limit on number of cells returned for each sample (only for Gene
Expression data). Retains the cells with the highest numbers of transcripts (default NULL).}

\item{min.umis}{Minimum UMI threshold for cells (default 0).}

\item{use.filtered}{Whether to use 10X's filtered data (as opposed to raw). Only relevant for
sample.dirs containing 10X outs directory (default FALSE).}

\item{reference}{For 10X V<3, specify which reference directory to use if sample.dir is outer
level 10X directory (only necessary if more than one reference used for sequencing).
(default NULL)}

\item{data.type}{Indicates the protocol of the input data. If not specified, input data will be
considered scRNA-seq data (default 'rna', alternatives: 'atac').}

\item{verbose}{Print messages (TRUE by default)}
}
\value{
List of merged matrices across data types (returns sparse matrix if only one data type
  detected), or nested list of matrices organized by sample if merge=F.
}
\description{
This function generates a sparse matrix (genes x cells) from the data generated by 10X's
cellranger count pipeline. It can process V2 and V3 data together, producing either a single
merged matrix or list of matrices. Also handles multiple data types produced by 10X V3 (Gene
Expression, Antibody Capture, CRISPR, CUSTOM).
}
\examples{
\dontrun{
# 10X output directory V2 -- contains outs/raw_gene_bc_matrices/<reference>/...
sample.dir1 <- "path/to/outer/dir1"
# 10X output directory V3 -- for two data types, Gene Expression and CUSTOM
sample.dir2 <- "path/to/outer/dir2"
dges1 <- read10X(list(sample.dir1, sample.dir2), c("sample1", "sample2"), min.umis = 50)
ligerex <- createLiger(expr = dges1[["Gene Expression"]], custom = dges1[["CUSTOM"]])
}
}
