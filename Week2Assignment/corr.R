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


