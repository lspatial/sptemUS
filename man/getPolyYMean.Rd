\name{getPolyYMean}
\alias{getPolyYMean}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generation of Regional Yearly Mean Based on the Input Polygons }
\description{
   Generate the regional yearly mean of air pollutant concentrations based on the input polygons
}
\usage{
getPolyYMean(polys,samp,tse,idF="siteid",ridF="rid",obsF="obs",dateF="date")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{polys}{The input region polygon map object (SpatialPolygonsDataFrame) to be used the regions for generation of the regiona monthly means  }
  \item{samp}{The sample spatial location map. Data format: \code{SpatialPointDataFrame}}
  \item{tse}{Time series for the siteid and date used for generation of monthly mean. }
  \item{idF}{location id name}
  \item{ridF}{region id name }
  \item{obsF}{observed value field name. }
  \item{dateF}{Date name}
}

\value{A data frame of data format: rid, year, month, mean}

\author{
Lianfa Li \email{lspatial@gmail.com}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
