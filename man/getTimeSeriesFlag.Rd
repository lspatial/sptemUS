\name{getTimeSeriesFlag}
\alias{getTimeSeriesFlag}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Extract temporal basis function}
\description{Extract temporal basis function}
\usage{
getTimeSeriesFlag(tFlag, tbasisFl, sublocs, biweekid = "biweekid")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tFlag}{Project flag path}
  \item{tbasisFl}{Temporal basis function file}
  \item{sublocs}{Subject file}
  \item{biweekid}{Biweekid }
}
\details{}
\value{The merged data frame will be return.}
\author{Lianfa Li}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# The following example is to extract the temporal basis function's output as predictive covariates
#   for the new preidction dataset.

data(sc_sample)
sc_sample_m=getTimeSeriesFlag(tFlag="sc_sample",tbasisFl="temporalbasis_ext",
                                 sublocs=sc_sample,biweekid="biweekid")
sc_sample_m$s_date.x=NULL
colnames(sc_sample_m)[which(colnames(sc_sample_m)=="s_date.y")]="s_date"
colnames(sc_sample_m)[which(colnames(sc_sample_m)=="no2V1")]="stbasis_no2_1"
colnames(sc_sample_m)[which(colnames(sc_sample_m)=="no2V2")]="stbasis_no2_2"
colnames(sc_sample_m)[which(colnames(sc_sample_m)=="noxV1")]="stbasis_nox_1"
colnames(sc_sample_m)[which(colnames(sc_sample_m)=="noxV2")]="stbasis_nox_2"

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
