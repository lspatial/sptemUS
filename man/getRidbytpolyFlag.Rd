\name{getRidbytpolyFlag}
\alias{getRidbytpolyFlag}
\title{Assign Thiessen Polygon ID to New Dataset}
\description{Assign Thiessen Polygon ID to New Dataset}
\usage{
getRidbytpolyFlag(tFlag, tpolyFl, pntlayer, isnearest = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tFlag}{project flag}
  \item{tpolyFl}{Thiessen polygon's name}
  \item{pntlayer}{Target shapefile to be assigned}
  \item{isnearest}{Whether nearest neighbors used to assign the items without id}
}
\details{Assign Thiessen Polygon ID to New Dataset}
\value{rid: Thiessen polygon's id,same as used in the model}
\author{Lianfa Li}
\note{
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
## This example is to illustrate to assging

data(sc_sample,sc_sample_loc)
sc_sample_loc$rid500m=getRidbytpolyFlag(tFlag="sc_sample",tpolyFl="sp_polys_500m_sel",sc_sample_loc)
index=match(sc_sample$gid,sc_sample_loc$gid)
sc_sample$rid500m=sc_sample_loc@data[index,"rid500m"]

}
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line


