## Part 3: take a directory of files and a threshold for complete cases and calculate the correlation
##         between sulfate and nitrate for monitor locations that meet stated threshold

corr <- function(directory, threshold = 0) {
    files_full <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    for(i in seq_along(files_full)) {
      dat <- rbind(dat, read.csv(files_full[i]))
    }
    splitdata <- split(dat, dat$ID)
    id <- 1:332
    nobs <- vector()
    for(i in seq_along(splitdata)) {
      nobs[i] <- sum(complete.cases(splitdata[[i]]))
    }
    comp_sets <- data.frame("id" = as.numeric(id), "nobs" = as.numeric(nobs))

    good_sets <- comp_sets$id[which(comp_sets$nobs > threshold)]

    good_data <- splitdata[good_sets]

    sulflist <- list()
    nitrlist <- list()
    corvect <- vector()
    corvect2 <- vector()
    
    if(length(good_data) > 0) {
      for(i in 1:length(good_data)) {
        sulflist[[i]] <- good_data[[i]][["sulfate"]]
        nitrlist[[i]] <- good_data[[i]][["nitrate"]]
        corvect[i] <- cor(x = sulflist[[i]], y = nitrlist[[i]], use = "pairwise.complete.obs")
      }
      corvect2 <- corvect[!is.na(corvect)]
    }
    as.numeric(corvect2)
}

## Test code
## 
## cr1 <- corr("specdata", 150)
## summary(cr1)
## 
## cr2 <- corr("specdata", 400)
## summary(cr2)
## 
## cr3 <- corr("specdata", 5000)
## summary(cr3)
## length(cr3)
## 
## cr4 <- corr("specdata")
## summary(cr4)
## length(cr4)
