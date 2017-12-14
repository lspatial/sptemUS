\name{genBiweekMeteos}
\alias{genBiweekMeteos}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generate the meteorological parameters on the server side for later extraction}
\description{This function is to use the biweekly averages of meteorological meters on the server side.}
\usage{
genBiweekMeteos(sublocs, tarVar = "pr", dname = "precipitation_amount", subgid = "geoid_latlongt", flag = "precip", from_biwk = 1, to_biwk = 574, start_date = "1992-01-01")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sublocs}{ spatial points data frame of the subject locations for geocoding the location }
  \item{tarVar}{
  the target meteorological variable name:
      tmmn: daily minimum temperature;
      tmmx: daily maximum temperature;
      vs: wind speed;
      th: wind direction;
      sph: specific humidity ;
      srad: surface downwelling shortwave flux in air
  }
  \item{dname}{
  the target meteorological variable channel name in the image file:
      tmmn: air_temperature;
      tmmx: air_temperature;
      vs: wind_speed;
      th: wind_from_direction;
      sph: specific_humidity ;
      srad: surface_downwelling_shortwave_flux_in_air
  }
  \item{subgid}{ Starting index of the models to be used to make the prediction}
  \item{flag}{ the project flag for later join}
  \item{from_biwk}{start biweek id}
  \item{to_biwk}{ end biweek id }
  \item{start_date}{start date}
}
\details{Generate the meteorological parameters}
\author{ Lianfa Li }
\note{}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
#Generate the meteorological parameters for the target locations for the biweekly period,
# from 01/01/1992 to 12/31/2013.  It may take some time to finish the computation. the flag is
# the project flag and will be used to extract the time-specific covariates for the function, extractBiweekMegteos

data(sc_sample_loc)
genBiweekMeteos(sc_sample_loc,tarVar="tmmn",dname="air_temperature",subgid="gid",flag="sc_sample",
                from_biwk=1,to_biwk=574, start_date="1992-01-01")
}
