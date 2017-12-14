
package.dir="/home/lpola/RWkspace/sptemUS"
setwd(package.dir)
### --- Use Roxygenise to generate .RD files from my comments
library(roxygen2)

.libPaths()
roxygenise(package.dir=package.dir)
