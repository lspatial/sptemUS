\name{getTrainCov}
\alias{getTrainCov}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Extract the covariate value from the train model}
\description{Extract the covariate value from the train model. The values are shuffled randomly for security purpose}
\usage{
getTrainCov(flag, acov)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{flag}{project flag, saved as sub path name on the server side.}
  \item{acov}{the covariate name}
}
\details{Extract the covariate value from the train model. The values are shuffled randomly for security purpose}
\value{Numeric vector for the covariate from the train datasetm shuffled randonly.}
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
# This function is provided to check the data consistency of the new prediction dataset before prediction.
# The following example is to check the boxplot for the train datasets and prediction dataset

data(sc_sample)
acov="min_temp";xlab="Minimum temperature (oC)"
colnames(sc_sample@data)[which(colnames(sc_sample@data)=="tmmn")]=acov
tr_acov=getTrainCov("sc_sample",acov)
boxplot(sc_sample@data[,acov],tr_acov,names=c("Prediction","Training"),xlab=xlab)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
