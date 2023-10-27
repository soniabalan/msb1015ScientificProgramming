# Libraries used
package_list = c("rstudioapi",
                 "rgbif",
                 "dplyr",
                 "stringr",
                 "stringdist",
                 "microbenchmark",
                 "doParallel",
                 "sp",
                 "sf", # co=requisite of "rgeos", takes a long time to install
                 "rgeos", # rgeos has been archived in 2023!
                 "ggplot2",
                 "ggmap",
                 "gridExtra",
                 "jpeg")


for (package in package_list) {
  if (!require(devtools)) install.packages(package)
}

library(package_list)