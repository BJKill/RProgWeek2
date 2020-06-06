## Part 1: finding mean of certain pollutants at certain locals

pollutantmean <- function(directory, pollutant, id = 1:332) {
    files_full <- list.files(directory, full.names = TRUE)
  #build data frame from files
    dat <- data.frame()
    for(i in seq_along(files_full)) {
      dat <- rbind(dat, read.csv(files_full[i]))
    }
  #Make list of data with with polutant and id nums
    dat_subset <- list()
    for(i in seq_along(id)) {
      dat_subset[[i]] <- dat[[pollutant]][which(dat$ID == id[i])]
    }
  #Make list into numberic vector
    dat_subset2 <- vector()
    for(i in seq_along(dat_subset)) {
      dat_subset2 <- c(dat_subset2, dat_subset[[i]])
    }
  #str(dat2_subset2)
    avg <- mean(dat_subset2, na.rm = TRUE)
    avg
}

## Output to test but not source on save
# pollutantmean("specdata", "nitrate")
# pollutantmean("specdata", "nitrate", 1:5)
# pollutantmean("specdata", "nitrate", c(1:5, 32, 58))
# pollutantmean("specdata", "sulfate", 1:10)
# pollutantmean("specdata", "nitrate", 70:72)
# pollutantmean("specdata", "nitrate", 23)

