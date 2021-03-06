##Week 2 Swirl on Logic, Functions, and Dates and Times
swirl()
library(swirl)
swirl()
BJKill
1

##Section 8: Logic
8
TRUE == TRUE
(FALSE == TRUE) == FALSE
6 == 7
6 < 7
10 <= 10

#Q: Which of the following evaluates to FALSE?
3 #9>=10

#Q: Which of the following evaluates to TRUE?
4 #-6 > -7

5 != 7     #Returns 'TRUE'
(5 = 7)    #Returns error <- needs '=='!
(5 == 7)!  #Returns error <- '!' in wrong spot!
!(5 == 7)  #Returns 'TRUE'

#Q: Which of the following evaluates to FALSE?
4 #!(0 >= -1)

#Q:  What do you think the following expression will evaluate to?: (TRUE != FALSE) == !(6 == 7)
2 #TRUE

FALSE & FALSE
TRUE & c(TRUE, FALSE, FALSE)  #Recycles through all 3
TRUE && c(TRUE, FALSE, FALSE) #only evaluates first value
TRUE | c(TRUE, FALSE, FALSE)  #Recycles through all 3
TRUE || c(TRUE, FALSE, FALSE) #Only evaluates first value
6 != 10 && FALSE && 1 >= 2
TRUE || 5 <= 9.3 || FALSE
5 > 8 || 6 != 8 && 4 > 3.9    #Evaluates '&&' then '||' then returns 'TRUE'

#Q: Which one of the following expressions evaluates to TRUE?
4 #TRUE && FALSE || 9 >= 4 && 3 < 6

#Q: Which one of the following expressions evaluates to FALSE?
2 #FALSE && 6 >= 6 || 7 >= 8 || 50 <= 49.5

isTRUE(6 > 4)

#Q: Which of the following evaluates to TRUE?
3 #!isTRUE(4 < 3)

identical("twins", "twins")
 
#Q: Which of the following evaluates to TRUE?
1 #identical(5 > 4, 3 < 3.1)

xor(5 == 6, !FALSE)  #XOR() ONLY RETURNED TRUE BC ONE IS TRUE AND ONE IS FLASE. Diff from union aka '|'
xor(5 == 5, !FALSE)  #Returns FALSE because BOTH TRUE

#Q: Which of the following evaluates to FALSE?
4 #xor(4 >= 9, 8 != 8.0)


ints <- sample(10)   #ints() is a random sample of ints from 1-10 w/0 replacement
ints                 #  5      6     9    2     8     10     7    4     3     1
ints > 5             #FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE

#which() takes a logical vector as an argument and returns the incicies of the vectors that are TRUE.
which(c(TRUE,FALSE,TRUE))   #Would return 1 3
which(ints>7)               #Returns 3 5 6

#Q: Which of the following commands would produce the indices of the elements in ints 
#   that are less than or equal to 2?
2 #which(ints <= 2)

#any() takes logical vector, returns TRUE if ANY are TRUE
#all() takes logical vector, returns TRUE if ALL are TRUE
#I mean...yeah, right?

any(ints < 0)
all(ints > 0)

#Q: Which of the following evaluates to TRUE?
1 #any(ints == 10)







##SWIRL Section 14: Dates and Times
swirl()
BJKill
1
14

d1 <- Sys.Date()
class(d1)
unclass(d1)
d1

d2 <- as.Date("1969-01-01")
unclass(d2)                  #returns '-365'

t1 <- Sys.time()
t1
class(t1)
unclass(t1)

t2 <- as.POSIXlt(Sys.time())
class(t2)
t2                          #prints same style as t1
unclass(t2)                 #prints a list
str(unclass(t2))
t2$min

weekdays(d1)                #prints Wednesday (today)
months(t1)                  #prints June (this month)
quarters(t2)                #prints Q2 (this quarter)

t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")
t4
class(t4)

Sys.time() > t1                            #prints TRUE bc the time now is later than it was before
Sys.time() - t1                            #prints 'Time difference of 8.783564 min'
difftime(Sys.time(), t1, units = 'days')   #prints 'Time difference of 0.006855525 days'


## Section 9: Functions. All functions defined in own file.

Sys.Date()

mean(c(2, 4, 5))

boring_function("My first function!")
boring_function

my_mean(c(4,5,10))

remainder(5)
remainder(11,5)
remainder(divisor = 11, num = 5)
remainder(4, div = 2)
args(remainder)

evaluate(sum,c(2,4,6))
evaluate(median,c(7,40,9))
evaluate(floor, 11.1)
evaluate(sd, c(1.4, 3.6, 7.9, 8.8))

#using "anonymous functions"
evaluate(function(x){x+1}, 6)
evaluate(function(x){x[1]}, c(8, 4, 0))
evaluate(function(x){x[3]}, c(8, 4, 0))

?paste
paste("Programming", "is", "fun!")

telegram("Fuck", "the", "police!")

mad_libs("place" = "London", adjective = "slimy", noun = "fingernail")

4 %mult_add_one% 5

"Good" %p% "job!"
"I" %p% "love" %p% "R!"

