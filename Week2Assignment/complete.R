## Part 2: Read directory and report number of observed cases in each file

complete <- function(directory, id = 1:332) {
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
    want
}

## Output to test but not source on save
# complete("specdata")
# complete("specdata", 1)
# complete("specdata", c(2,4,8,10,12))
# complete("specdata", 30:25)

