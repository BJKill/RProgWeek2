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

















