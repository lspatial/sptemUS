\name{pyparpredict}
\alias{pyparpredict}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Python parallel computation for prediction}
\description{Python parallel computation for prediction by access to server. }
\usage{
pyparpredict(dset, flag = "prefile", nModel = 6, ncore = 6)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dset}{Data frame to be predicted}
  \item{flag}{Flag path to save the predicted files}
  \item{nModel}{Number of models}
  \item{ncore}{Number of cores}
}
\details{This function is to leverage the server to get the compution}
\value{Use the flag to get the final predictions. }
\references{
%% ~put references to the literature/web site here ~
}
\author{
Lianfa Li
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# This example illustrates how to use the python to call R function to make parallel predictions
#  for NO2 and NOx concentration.  The output of multiple models will be saved on the server side using the flag path.
#   You can use the function, weiA2EnsFlag to get the weighted averages from the saved files using the project flag.

# The first step is to ensure no missing vaues in the prediction dataset

data(sc_sample_m)
colnames=c('dist_fcc1','min_temp', 'winsp', 'popd','cl_freewaynox','cl_nonfreewaynox', 'rid500m',
           'aqs_add_no2_y', 'aqs_add_nox_y','stbasis_no2_1','stbasis_no2_2','stbasis_nox_1','stbasis_nox_2',
           'trdenscaled300_5km_r')

exp="sc_sample_m[which("
for(i in c(1:length(colnames))){
  acol=colnames[i]
  exp=paste(exp,"!is.na(sc_sample_m[,'",acol,"'])",sep="")
  if(i<length(colnames)){
    exp=paste(exp," & ",sep="")
  }
}
exp=paste(exp,"),]",sep="")
print(exp)
sc_sample_sub=eval(parse(text=exp))

# Then, call pyparpredict to initiate the parallel predictions on the server side.

no2_ens=pyparpredict(sc_sample_sub,'no2',flag='sc_sample_no2',nModel=10,ncore=5,idF="gid")
nox_ens=pyparpredict(sc_sample_sub,'nox',flag='sc_sample_nox',nModel=10,ncore=5,idF="gid")

}
