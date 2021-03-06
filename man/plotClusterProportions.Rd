% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rliger.R
\name{plotClusterProportions}
\alias{plotClusterProportions}
\title{Plot cluster proportions by dataset}
\usage{
plotClusterProportions(object, return.plot = FALSE)
}
\arguments{
\item{object}{\code{liger} object. Should call quantileAlignSNF before calling.}

\item{return.plot}{Return ggplot object (default FALSE)}
}
\value{
print plot to console (return.plot = FALSE); ggplot object (return.plot = TRUE)
  list of ggplot objects.
}
\description{
Generates plot of clusters sized by the proportion of total cells
}
\examples{
\dontrun{
# ligerex (liger object), factorization complete input
ligerex <- quantile_norm(ligerex)
# plot cluster proportions
plotClusterProportions(ligerex)
}
}
