##Warmup to Week2

dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "Data/diet_data")

list.files("Data/diet_data")
andy <- read.csv("Data/diet_data/Andy.csv")
head(andy)
length(andy$Day)
dim(andy)
str(andy)
summary(andy)
names(andy)

andy[1, "Weight"]     #finds andy's starting weight
andy[30, "Weight"]    #finds andy's ending weight

andy[which(andy$Day ==30), "Weight"]     #create subset of 'Weight' col where 'Day' is 30
andy[which(andy[,"Day"]==30), "Weight"]  #create subset of 'Weight' col where 'Day' is 30

andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]
andy_loss <- andy_start - andy_end
andy_loss
?list.files

files <- list.files("Data/diet_data")
files
files[1]
files[2]
files[3:5]

head(read.csv(files[3])) #returns error. 'diet_data' is a file, but files[3] = 'John.csv'. not in dir!

files_full <- list.files("Data/diet_data", full.names = TRUE) #appends all appropriate paths to name
              #above command will add '/Data/diet_data/' before 'John.csv' output of 'files_full[3]'
files_full[3]
read.csv(files_full[3])
head(read.csv(files_full[3]))

andy_david <- rbind(andy, read.csv(files_full[2]))    #add david's data under andy's data frame
head(andy_david)
tail(andy_david)

day_25 <- andy_david[which(andy_david$Day == 25), ]
day_25_weight <- andy_david[which(andy_david$Day == 25), "Weight"]
day_25
day_25_weight

#use a loop to merge all data together useing rbind. first create empty dataframe
dat <- data.frame()
for (i in 1:5) {
  dat <- rbind(dat, read.csv(files_full[i]))
}

str(dat)
tail(dat)

median(dat$Weight)
median(dat$Weight, na.rm = TRUE)
median(dat$Weight[which(dat$Day == 30)], na.rm = TRUE) #returns 192

dat_30 <- dat[which(dat$Day == 30),]
dat_30
median(dat_30$Weight)                                  #returns 192 after 3 lines of code...

#create a function to return the median weight of any given day
#first define directary holding data. second: define day for median to be taken

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

weightmedian(directory = "Data/diet_data", day = 20)
median(dat$Weight[which(dat$Day == 20)], na.rm = TRUE)

weightmedian(directory = "Data/diet_data", day = 4)
median(dat$Weight[which(dat$Day == 4)], na.rm = TRUE)

weightmedian(directory = "Data/diet_data", day = 17)
median(dat$Weight[which(dat$Day == 17)], na.rm = TRUE)

#a better way to create a data frame - a list of data frames we'll then combine
summary(files_full)
files_full
tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)
tmp
for (i in seq_along(files_full)) {
  tmp[[i]] <- read.csv(files_full[[i]])
}
str(tmp)

#AN EVEN BETTER FUCKING WAY TO CREATE LIST OF DATA FRAMES (before combining)
tmp2 <- lapply(files_full, read.csv)
str(tmp2)

#NOT DONE THO.  Must combine list into one data frame because these aren't fun:
str(tmp[[1]])
head(tmp[[1]][,"Day"])

#to combine,
output <- do.call(rbind, tmp)
str(output)
output2 <- do.call(rbind, tmp2)
str(output2)


##SO, TL;DR ON MAKING DATAFRAME FROM FILES:
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "Data/diet_data")
list.files("Data/diet_data")
files_full <- list.files("Data/diet_data", full.names = TRUE)
tmp3 <- lapply(files_full, read.csv)
dat3 <- do.call(rbind, tmp3)
str(dat3)

##SO, TL;DR ON MAKING DATAFRAME FROM FILES AND READING DIRECTLY INTO 'Data' FOLDER:
oldwd <- getwd()
setwd("Data")
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")
list.files("diet_data")
files_full <- list.files("diet_data", full.names = TRUE)
tmp4 <- lapply(files_full, read.csv)
dat4 <- do.call(rbind, tmp4)
str(dat4)
setwd(oldwd)

