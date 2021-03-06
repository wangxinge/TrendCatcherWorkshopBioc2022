% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/draw_GOHeatmap.R
\name{draw_GOHeatmap}
\alias{draw_GOHeatmap}
\title{Draw GOHeatmap contianing Terms from TimeHeatmap and included Genes}
\usage{
draw_GOHeatmap(
  master.list,
  time.window = "",
  go.terms = "",
  merge.df = NA,
  logFC.thres = 2,
  figure.title = "",
  save.tiff.path = NA,
  tiff.res = 100,
  tiff.width = 1500,
  tiff.height = 1500
)
}
\arguments{
\item{master.list, }{a list object. The output from run_TrendCatcher function, contains master.table element.}

\item{time.window, }{a character. Must be one of the merge.df$t.name.}

\item{go.terms, }{a character array. Must be an array of go terms from the merge.df$Description.}

\item{merge.df, }{a dataframe. The output dataframe from output list of draw_TimeHeatmap_GO or draw_TimeHeatmap_enrichR. Use $merge.df to obtain it.}

\item{logFC.thres, }{a numeric variable. The logFC threshold compared to each genes previous break point expression level.
By default is 2, meaning for each gene, the current time window's expression level is 2-fold compared to previous
break point's expression level.}

\item{figure.title, }{character}

\item{save.tiff.path, }{by default is NA}

\item{tiff.res, }{resolution}

\item{tiff.width, }{figure width}

\item{tiff.height, }{figure height}
}
\value{
A list object, including elements names merge.df and time.heatmap.
time.heatmap is the ggplot object. merge.df includes all the enrichR enrichment result and activation/deactivation time.
}
\description{
This funcitons takes the master.list output from run_TrendCatcher, and merge.df output from draw_TimeHeatmap_GO and draw_TimeHeatmap_enrichR.
And showing all the genes used for enrichment analysis and their logFC compared to previous break point.
}
\examples{
\dontrun{
example.file.path<-system.file("extdata", "BrainMasterList.rda", package = "TrendCatcher")
load(example.file.path)
th.obj<-draw_TimeHeatmap_GO(master.list = master.list)
merge.df<-th.obj$merg.df

time.window<-"0h-6h"
go.terms<-c("regulation of defense response", "leukocyte migration", "myeloid leukocyte migration", "leukocyte chemotaxis",
"granulocyte chemotaxis", "cellular response to chemokine", "chemokine-mediated signaling pathway", "angiogenesis", "sprouting angiogenesis",  "respone to bacterium", "leukocyte mediated immunity")
go.df<-draw_GOHeatmap(master.list = master.list, time.window = "0h-6h", go.terms = go.terms, id.ensembl = TRUE, merge.df = merge.df, logFC.thres = 2)
}
}
