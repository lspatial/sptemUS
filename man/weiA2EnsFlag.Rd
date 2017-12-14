\name{weiA2EnsFlag}
\alias{weiA2EnsFlag}

\title{Weighted averages by the output of mixed models on the server side}
\description{Weighted averages by the output of mixed models on the server side}
\usage{
weiA2EnsFlag(flag, pol = "no2", preF = "preno2", idF = "geoid_latlongt", dateF = "s_date")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{flag}{Flag of the ensemble output, used as path in the server side}
  \item{pol}{Pollutant type,"no2" or "nox"}
  \item{preF}{predicted value name, "preno2" or "prenox"}
  \item{idF}{unique geoid }
  \item{dateF}{Biweekly first day date}
}
\details{}
\value{The result is the averages weighted by r2}
\author{lianfa Li}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# Here is the example, assuming the files of point estimates already exsiting on the server
weivno2=weiA2EnsFlag(flag="sc_sample_no2",pol="no2",preF="preno2",idF="gid",dateF="s_date")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~weighted averages }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~ensemble learning }% __ONLY ONE__ keyword per line
