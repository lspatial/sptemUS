\name{conOptNo2}
\alias{conOptNo2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Constrained Optimization for NO2 Series for a Location}
\description{
Constrained optimization for NO2 series, used to adjust the estimated NO2 concentration.
}
\usage{
conOptNo2(no2x_season_trends, asite_dt, predId = "preno2")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{no2x_season_trends}{Data frame of temporal basis function, can be obtained by access to the server using getTSeries}
  \item{asite_dt}{A time series of  point estimates at a target location}
  \item{predId}{The predicated value's column name}
}
\details{
Constrained optimization for NO2 series, used to adjust the estimated NO2 concentration.
}
\value{Data frame with the adjusted values, geo id and time id.}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
## The following example illustrates how to use the point estimates to make constrained optimization
##   to get the adjusted estimates of NO2

data(merged_no2x)

no2x_season_trends=getTSeries(flag="sc_sample")
no2x_season_trends$s_date=as.Date(no2x_season_trends$s_date)
merged_no2x$gid=as.integer(merged_no2x$gid)

# Check the time seires for the geo id, 30314
agid=30314
tt=merged_no2x[merged_no2x$gid==agid,]
asiteDt=tt
asiteDt$s_date=as.Date(asiteDt$s_date)
asiteDt$biweekid=(asiteDt$s_date-as.Date("1992-01-01"))/14+1

tseriesNO2Obj=conOptNo2(no2x_season_trends,asiteDt,predId="no2_m")
tseries_no2=tseriesNO2Obj$series
tseries_no2$biweekid=(as.Date(tseries_no2$start_date)-as.Date("1992-01-01"))/14+1

tseries_no2=tseries_no2[which(is.finite(tseries_no2$sim)),]
plot(tseries_no2$start_date,tseries_no2$sim, type="l",xlab="Date",ylab="NO2 (ppb)", col="blue")
points(asiteDt$s_date,asiteDt$no2_m,col="blue")

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
