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

#all expressions return same value although some better than others for clarity
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, mydata)
sd(na.rm = FALSE, x = mydata)

#nothing worked here
args(lm)
lm(data = mydata, y - x, model = FALSE, 1:100)
lm(y - x, data = mydata, 1:100)


f<-function() {
  cat("Hello, world!\n")
}
f()

f <- function(a, b = 1, c = 2, d = NULL) {
}

#lazy evaluation. The function never uses b, so no input is fine
f <- function(a,b) {
  a^2
}
f(2)

#will exicute until error, so a prints just fine
f <- function(a,b) {
  print(a)
  print(b)
}
f(45)
f(45,54)

#using '...'
myplot <- function(x, y, type = "1", ...) {
  plot(x, y, type = type, ...)
}

args(paste)
args(cat)

##if '...' comes first, everything else after must be explicitly matched

lm <- function(x) {x * x}
lm
search()
rm(ls)
rm(z) ##for next function

f <- function(x,y) {
  x^2 + y/z
}

f(2,4)  #error because no 'z' in global environment
z = 2
f(2,4)  #although no z input, it found it in glob env


make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}

cube <- make.power(3)
cube(3)    #becomes a function and asks for x
square <- make.power(2)
square(3)

ls(environment(cube))
get("n", environment(cube))
ls(environment(square))
get("n", environment(square))

y<-10
f<-function(x) {
  y <- 2
  y^2 + g(x)   #g(x) = x * 10 bc y=10 in the environment g was defined in   
}

g<-function(x) {  
  x*y #Free variables in R functions take values from the environment in which the function is defined (10)
}

f(3) #returns 34

rm(y) #take 'y' out of global environment

g <- function(x) {
  a <- 3
  x+a+y
}

g(2) #returns error. no 'y' in global environment
y<-3
g(2) #ta daaaaa



##Optimization for parameters on a vector of data.
make.NegLogLik <- function(data, fixed=c(FALSE,FALSE)) {
  params <- fixed
  function(p) {
    params[!fixed] <- p
    mu <- params[1]
    sigma <- params[2]
    ##Caclulate the Normal density by **minimizing negative LLE**
    a <- -0.5*length(data)*log(2*pi*sigma^2)
    b <- -0.5*sum((data-mu)^2)/sigma^2
    -(a+b)
  }
}

set.seed(1); normals <-rnorm(100,1,2)
nLL <- make.NegLogLik(normals)
nLL    
nLL() #returned error. no 'p' defined
ls(environment(nLL))

optim(c(mu = 0, sigma = 1), nLL)$par  #returns 1.2182 and 1.7873

#fixing sigma  = 2
nLL2 <- make.NegLogLik(normals,c(FALSE,2))
optimize(nLL2, c(-1,3))$minimum       #returns 1.2178

#fixing mu = 1
nLL1 <- make.NegLogLik(normals, c(1, FALSE))
optimize(nLL1, c(1e-6,10))$minimum    #returns 1.8006


##plot it
nLL1 <- make.NegLogLik(normals, c(1,FALSE))
x <- seq(1.7, 1.9, len = 100)
y <- sapply(x, nLL1)
plot(x, exp(-(y-min(y))))

Nll2 <- make.NegLogLik(normals, c(FALSE,2))
x2 <- seq(0.5, 1.5, len = 100)
y2 <- sapply(x2, Nll2)
plot(x2, exp(-(y2-min(y2))))
