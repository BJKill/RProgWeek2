## Week 2 Programming Assignment
junkfunc1 <- function() { 
  files_full <- list.files("Data/specdata", full.names = TRUE)
  tmp <- lapply(files_full, read.csv)
  dat <- do.call(rbind, tmp)
  str(dat)
  tail(dat)
  head(dat)
  pollutant1 = "nitrate"
  mean(dat[[pollutant1]], na.rm = TRUE)
}






weightmedian <- function(directory, day) {
  #content of function
  files_list <- list.files(directory, full.names = TRUE)  #creates list of files
  dat2 <- data.frame()
  for (i in 1:5) {
    dat2 <- rbind(dat2, read.csv(files_list[i]))
  }
  dat2_subset <- dat2$Weight[which(dat2$Day == day)]
  median(dat2_subset, na.rm = TRUE)
}




## Part 1: finding mean of certain pollutants at certain locals

homewd <- "C:/Users/brand/Documents/R/Coursera/RProgWeek2"
setwd(homewd)

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



## Part 2: Read directory and report number of observed cases in each file

complete <- function(directory, id = 1:332) {
    setwd("Data")
    files_full <- list.files(directory, full.names = TRUE)
  #build data frame from files
    dat <- data.frame()
    for(i in seq_along(files_full)) {
      dat <- rbind(dat, read.csv(files_full[i]))
    }
  #create empty vector for nobs
    nobs <- vector()
  #split data frame into list by ID#
    splitdat <- split(dat, dat$ID)
  #build nobs vector by going thru split data frame
    for(i in seq_along(id)) {
      nobs[i] <- sum(complete.cases(splitdat[[id[i]]]))
    }
    want <- data.frame("id" = as.numeric(id), "nobs" = as.numeric(nobs))
    setwd(oldwd)
    want
}

## Output to test but not source on save
#complete("specdata")
#complete("specdata", 1)
#complete("specdata", c(2,4,8,10,12))
#complete("specdata", 30:25)


## Part 3: take a directory of files and a threshold for complete cases and calculate the correlation
##         between sulfate and nitrate for monitor locations that meet stated threshold

corr <- function(directory, threshold = 0) {
  setwd("Data")
  files_full <- list.files(directory, full.names = TRUE)
  
  #build data frame from files
  dat <- data.frame()
  for(i in seq_along(files_full)) {
    dat <- rbind(dat, read.csv(files_full[i]))
  }
  setwd(oldwd)
  comp_sets <- complete(directory)
  good_sets <- comp_sets$id[which(comp_sets$nobs >= threshold)]
  good_data <- dat[[good_sets]]
  print(class(good_data))
  setwd(oldwd)
  head(good_data)
}












