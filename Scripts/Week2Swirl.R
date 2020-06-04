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



























