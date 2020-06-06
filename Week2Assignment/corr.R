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
    #str(comp_sets)
    good_sets <- comp_sets$id[which(comp_sets$nobs >= threshold)]
    #str(good_sets)
    good_data <- splitdata[good_sets]
    #str(good_data)
    sulfvect <- vector()
    nitrvect <- vector()
    for(i in seq_along(good_data)) {
      sulfvect <- c(sulfvect, good_data[[i]][["sulfate"]])
      nitrvect <- c(nitrvect, good_data[[i]][["nitrate"]])
    }
    polmat <- cbind(sulfvect, nitrvect)
    corvect <- vector()
    corvect <- cor(polmat, use = "pairwise.complete.obs")
    corvect
    #str(sulfvect)
    #str(nitrvect)
    #corvect <- vector()
    #for(i in seq_along(good_data)) {
    #  corvect[i] <- cor(good_data[[i]][["nitrate"]], good_data[[i]][["sulfate"]])
    #}
    #corvect
}


