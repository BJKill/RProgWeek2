##Week 2 Lectures

#if/else statements
if(x >3) {
  y <- 10
} else {
  y <- 0
}

y <- if(x > 3) {
  10
}  else {
  0
}

for(i in 1:10) {
  print(i)
}


x <- c("a", "b", "c", "d")

##all will print each character in x
for(i in 1:4) {
  print(x[i])
}

for(i in seq_along(x)) {
  print(x[i])
}

for(letter in x) {
  print(letter)
}

for(i in 1:4) print(x[i])  ##if you only have one command, no {} needed

##nested for loop to print each entry in matrix
x<-matrix(1:6, 2,3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i,j])
  }
}

##same thing but my way
for(i in 1:nrow(x)) {
  for(j in 1:ncol(x)) {
    print(x[i,j])
  }
}

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}

z<-5
while(z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1,1,0.5) ##creates random binomial walk
  if(coin == 1) {
    z<- z + 1
  } else {
    z <- z - 1
  }
}

x0 <- 0
tol <- 1e-4 ## 1x10^-4
repeat {
  x1 <- rnorm(1)
  if(abs(x1-x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}

for(i in 1:100) {
  if(i <= 20) {
    next
  }
  print(i)
}

for(i in 1:100) {
  print(i)
  if(i > 20) {  ##stops after 20 iterations but prints '21' bc print is before break
    break
  }
}

##funtion time!
add2 <- function(x,y) {
  x + y
}
add2(3,5)  #correctly returns 8

above10 <- function(x) {
  use <- x > 10
  x[use]
}

sue <- c(65, 2, 1000000, -10, 9)
above10(sue)

aboven <- function(x,n) {
  use <- x > n
  x[use]
}

aboven(sue,0)
aboven(sue,5)

t<-1:20
aboven(t,12)

#finding the mean of columns in a data frame or matrix
columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)             #dummy variable for # cols
  means <- numeric(nc)      #create empty numeric vector
  for(i in 1:nc) {
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  print(means)
}

columnmean2 <- function(y, removeNA = TRUE) {
  means <- 1:ncol(y)
  for(i in 1:ncol(y)) {
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  print(means)
}

mat <- matrix(1:30, nrow = 5, ncol = 6)

columnmean(mat)
columnmean2(mat)

columnmean(airquality)
columnmean2(airquality)



