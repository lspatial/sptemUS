\name{conOptNox}
\alias{conOptNox}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Constrained Optimization for NOx Series for a Location
}
\description{
Constrained Optimization for NOx Series for a Location., used to adjust the estimated NOx concentration.
}
\usage{
conOptNox(no2x_season_trends, asite_dt, no2Series, predId = "prenox", no2Id = "sim")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{no2x_season_trends}{
Data frame of temporal basis function, can be obtained by access to the server using getTSeries
}
  \item{asite_dt}{
A time series of  point estimates at a target location
}
  \item{no2Series}{
The NO2 adjusted values, used to calibrate the NOx estimates.
}
  \item{predId}{
The predicated value's column name
}
  \item{no2Id}{
Column name for the no2 adjusted values.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Data frame with the adjusted values, geo id and time id.
}
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
##   to get the adjusted estimates of NO2 and NOx


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
tseriesNOxObj=conOptNox(no2x_season_trends,asiteDt,tseries_no2,predId="nox_m")
tseries_nox=tseriesNOxObj$series
tseries_nox$biweekid=(as.Date(tseries_nox$start_date)-as.Date("1992-01-01"))/14+1

tseries_no2=tseries_no2[which(is.finite(tseries_no2$sim)),]
tseries_nox=tseries_nox[which(is.finite(tseries_nox$sim)),]
plot(tseries_nox$start_date,tseries_nox$sim,ylim=c(min(tseries_no2$sim,asiteDt$no2_m)-5,
                                                   max(tseries_nox$sim,asiteDt$nox_m)+5),
     type="l",xlab="Date",ylab="NOx (ppb)", col="red")
lines(tseries_no2$start_date,tseries_no2$sim, type="l",xlab="Date",ylab="NO2 (ppb)", col="blue")
points(asiteDt$s_date,asiteDt$nox_m,col="red")
points(asiteDt$s_date,asiteDt$no2_m,col="blue")
legend(x=as.Date("2010-08-01"),y=max(tseries_nox$sim,asiteDt$nox_m)+4, cex=1,legend=c("Original NOx estimate",
      "Adjusted NOx series","Original NO2 estimate","Adjusted NO2 series"),
       bty="n",lty=c(NA,1,NA,1),pch=c(1,NA,1,NA),col=c("red","red","blue","blue"))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
