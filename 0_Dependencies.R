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
                 # "rgeos", # rgeos has been archived in 2023 - you might not be able to install it on your machine
                 "ggplot2",
                 "gridExtra",
                 "jpeg")


for (package in package_list) {
  if (!require(package, character.only = TRUE)) {
    # If the package is not available, install it
    install.packages(package)
  }
  library(package, character.only = TRUE)
}


