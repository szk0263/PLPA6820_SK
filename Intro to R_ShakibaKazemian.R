##### Intro to R_SK #####

#### First thing first ####

#1. You can put a comment using a "#" sign and annotate things.
#2. If you put several hash tags (at least 4) you can make sections:
##### This is a section #####

#3. To submit a line of code to the consul you can use key stroke ctrl + Enter

#4. The codes are case sensitive!! be careful to not make an error!


#### Exercise number 1 ####
# R is a big calculator

2+2 # returns 4
2-2 # returns 0
2/2 # returns 1
2*2 # returns 4

#### Exercise number 2 ####
# Creating an R object

# This is a numeric variable
x <- 2  # storing values into letters
y = 3  # Both <- and = work (arrow is preferred)

x + y  # returns 5
x - y  # returns -1
x/y  # returns 0.6666
x * y  # returns 6

# This is a character variable
Name <- "Shakiba" #When you are creating a character variable you need to put it in a double quote.
Seven <- 7

x + Seven 

## Function:
# Is a utility that does sth to an object

class(Seven) # Class is a pre-loaded function, it gives us the info about the variable type
class(x)

## Concatenate function:
# It is a very universal function in R for making strings of things
vec <- c(1, 2, 3, 4, 5, 6, 7)
vec <- c(1:7) # Another way to write it
vec <- 1:7  # also works without the concatenate function
vec2 <- c("Shakiba", "Chris", "Deb")  # character vector 
vec3 <- c(TRUE, FALSE, TRUE)  # logical vector (binary TRUE/FALSE, should be in capital letters)

vec[4] # It gives us the fourth value of the vec object
vec2[2]

vec + x  # will add the scalar x to the vec object 


## Basic functions in R
vec
mean(vec)  # mean
sd(vec)  # standard deviation
sum(vec)  # sum
median(vec)  # median
min(vec)  # minimum 
max(vec)  # maximum
summary(vec)  #IQR - output depends on the data class
abs(vec) # absolute value
sqrt(vec) # square root
sqrt(sum(vec))
log(vec) # natural log
log10(vec) # log base 10
exp(vec) # power of e


### logical operators
# > greater than
# < less than
# | or
# & and
# = equals (used for assigning values from left to right)
# == exactly equal (for showing equality between values)
# >= greater than or equal
# != not equal to

# Practice time!
1>2 # R says it is FALSE
1<2 # But this one is TRUE
1 <= 2 # TRUE
1 == 1 # TRUE
1 == 2 | 1 == 1 # TRUE
1 == 2 & 1 == 1 # FALSE 
1 == 1 & 1 == 1 # TRUE

# Subsetting:
t <- 1:10
t[(t > 8) | (t < 5)]  # only the numbers that are greater than 8 or less than 5
t[(t > 8) & (t < 10)]  # returns 9
t[t != 2]  # returns elements of t that are not exactly equal to 2
t[!t == 2] # multiple ways to do the same thing
32 %in% t # asks R if a number exists within a string of numbers

### Data types
# scalar objects
x
# vectors
t

# example of a numeric matrix
mat1 <- matrix(data = c(1, 2, 3), nrow = 3, ncol = 3)
mat1

# example of a character matrix
mat2 <- matrix(data = c("Shakiba", "Aron", "Chris"), nrow = 3, ncol = 3)
mat2 

mat1[1] #gives me the first value of matrix1
mat2[2] #gives me the second value of matrix2
mat1[1, 3] #first row,third column
mat1[1,] #gives the first row
mat1[,3] #gives the third column

# Dataframes
# Dataframes are basically like matrices but with multiple data classes or data types
df <- data.frame(mat1[,1], mat2[,1]) 
df

colnames(df) <- c("value", "name")
df[1,2] #first row, second column
df[1] #first column
df[, "value"]
df$value # the same as the previous line
df$value[1]
df$name[3]

### Subsetting or indexing the data frames
# very common with large dataframes

# the element of the column value such that name is equal to Shakiba
df$value[df$name == "Shakiba"]

# returns all rows with the value Shakiba in the name column
df[df$name == "Shakiba",]

## Important example:
# returns the elements of the column value within the data frame such that name is not equal to Shakiba and Aron
df$value[df$name %in% c("Shakiba", "Aron")]

# Not equals to Shakiba!
df$value[df$name != "Shakiba"] 

# subset function
subset(df, name == "Shakiba")

# making a new column in a dataframe
df$log_value <- log(df$value)
df

#### Installing packages ####
# an R package is just a bunch of functions coming together !!

install.packages("ggplot2")  # we should use quotes around the package name
install.packages("tidyverse")
install.packages("lme4")
install.packages("purrr")
install.packages("dplyr")
install.packages("emmeans")

# using the function "library", you can load packages
library(tidyverse)


#### Reading in data to R ####

# for this we use  read.csv() function by specifying the path to the file
# for CSV or TXT files
# A CSV file is literally a TXT file that the values in it are separated by a comma
# TXT files can have multiple delimiters! But CSV files just have commas

getwd() # To find our working directory path
csv <- read.csv("EXP3.csv")
csv <- read.csv("C:/Users/szk0263/Documents/Exp3.csv", na.strings = "na")
str(csv)
csv2 <- file.choose()
csv3 <- read.csv(file.choose(), na.strings = "na")
