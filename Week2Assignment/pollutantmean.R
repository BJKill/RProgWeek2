## Part 1: finding mean of certain pollutants at certain locals

pollutantmean <- function(directory, pollutant, id = 1:332) {
  files_full2 <- list.files(c("Data/", directory), full.names = TRUE)
  #build data frame from files
  dat2 <- data.frame()
  for(i in seq_along(files_full2)) {
    dat2 <- rbind(dat2, read.csv(files_full2[i]))
  }
  #Make list of data with with polutant and id nums
  dat2_subset <- list()
  for(i in seq_along(id)) {
    dat2_subset[[i]] <- dat2[[pollutant]][which(dat2$ID == id[i])]
  }
  #Make list into numberic vector
  dat2_subset2 <- vector()
  for(i in seq_along(dat2_subset)) {
    dat2_subset2 <- c(dat2_subset2, dat2_subset[[i]])
  }
  #str(dat2_subset2)
  avg <- mean(dat2_subset2, na.rm = TRUE)
  avg
}

## Output to test but not source on save
#pollutantmean("specdata", "nitrate")
#pollutantmean("specdata", "nitrate", 1:5)
#pollutantmean("specdata", "nitrate", c(1:5, 32, 58))
#pollutantmean("specdata", "sulfate", 1:10)
#pollutantmean("specdata", "nitrate", 70:72)
#pollutantmean("specdata", "nitrate", 23)

