\name{getTSeries}
\alias{getTSeries}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Access the temporal basis function of NO2 and NOx for a target project}
\description{Access the temporal basis function of NO2 and NOx for a target project}
\usage{
getTSeries(flag)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{flag}{The project flag name, used on the server side. }
}
\details{Access the temporal basis function of NO2 and NOx for a target project}
\value{The data frame for the temporal basis function.}
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
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (flag)
{
    conn = RSclient::RS.connect(host = "noxchs2.usc.edu", port = 5501)
    RSclient::RS.assign(conn, "flag", flag)
    res = RSclient::RS.eval(conn, getTSereis(flag = flag))
    RSclient::RS.close(conn)
    return(res)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
