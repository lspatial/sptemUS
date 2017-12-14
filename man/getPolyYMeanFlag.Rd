\name{getPolyYMeanFlag}
\alias{getPolyYMeanFlag}
\title{Extract regional yearly mean of air pollutants}
\description{Extract regional monthly mean of air pollutants}
\usage{
getPolyYMeanFlag(tFlag, tpolyFl, biweekAvFl, pntlayer, ridF = "rid", siteid = "ID2")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tFlag}{project flag path}
  \item{tpolyFl}{polygon layer name}
  \item{biweekAvFl}{CSV primary file name (no extension) of biweekly mean values}
  \item{pntlayer}{Subject location SpatialPointsDataFrame}
  \item{ridF}{Regional id}
  \item{siteid}{AQS site id}
}
\details{This funciton is to extract the yearly mean of air pollutants}
\value{The values for yearly mean}
\author{Lianfa Li}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
}
\examples{

data(sc_sample,sc_sample_loc)
sc_sample_p=sc_sample
index=match(sc_sample_p$gid,sc_sample_loc$gid)
coordinates(sc_sample_p)=coordinates(sc_sample_loc[index,])
sp::proj4string(sc_sample_p)=sp::proj4string(sc_sample_loc)

sc_sample_p$year=as.integer(format(sc_sample$s_date,"\%Y"))
sc_sample$ymean_no2=getPolyYMeanFlag(tFlag="sc_sample",tpolyFl="aqs_added_sites_no2_poly",
     biweekAvFl="aqs_added_biweek_no2_yly", pntlayer=sc_sample_p,ridF="rid",siteid="ID2",yearF="year")

}
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
