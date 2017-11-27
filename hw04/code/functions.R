# ================================================================
# title: functions
# description: Functions to clean up raw data
# input(s): Vector from .csv file
# output(s): Summary statistics and clean up data
# ================================================================

a <- c(1,4,7,NA,10)
library(stringr)

# title: Remove Missing Values
# description: Takes a vector and if it stores any missing values, get_missing() returns a vector 
#              without them.
# input(s): vec: vector
# output(s): new_vector: vector without missing values
remove_missing <- function(vec){
  new_vector <- 0
  new_vector <- vec[is.na(vec) == FALSE]
  return(new_vector)
}
remove_missing(a)

# title: Get Minimum Value
# description: Takes a numeric vector and an optional logical argument to return the lowest 
#              numeric value. Function won't work with a type character vector.
# input(s): vec: vector, na.rm: logical argument of whether there are missing values.
# output(s): min: minimim value
get_minimum <- function(vec, na.rm = FALSE){
  new_vec <- vec
  if(class(vec) != "numeric"){
    print("non-numeric argument")
    break
  } else if(na.rm == TRUE){
    new_vec <- remove_missing(vec)
  }
  new_vec <- sort(new_vec)
  min <- new_vec[1]
  return (min)
}
get_minimum(a, na.rm = TRUE)

# title: Get Maximum Value
# description: Takes a numeric vector and an optional local argument to return the highest 
#              numeric value. Function won't work with a type character vector.
# input(s): vec: vector, na.rm: optional logical argument for the occurence of missing values.
# output(s): max: maximum value
get_maximum <- function(vec, na.rm = FALSE){
  new_vec <- vec
  if(class(vec) != "numeric"){
    print("non-numeric argument")
    break
  } else if(na.rm == TRUE){
    new_vec <- remove_missing(vec)
  }
  new_vec <- sort(new_vec)
  max <- new_vec[length(new_vec)]
  return (max)
}
get_maximum(a, na.rm = TRUE)

# title: Get Range
# description: Computes and returns the range of a numeric vector with no missing values. 
# input(s): vec: vector, na.rm: optional logical argument for the occurrence of missing values.
# output(s): range: the range for the values in the vector.
get_range <- function(vec, na.rm = FALSE){
  new_vec <- vec
  if(class(vec) != "numeric"){
    print("non-numeric argument")
    break
  } else if(na.rm == TRUE){
    new_vec <- remove_missing(vec)
  }
  max <- get_maximum(new_vec, na.rm)
  min <- get_minimum(new_vec, na.rm)
  range <- max - min
  return (range)
}
get_range(a, na.rm = TRUE)

# title: Get Tenth Percentile
# description: Takes a numeric vector with no missing values to compute its tenth percentile value.
# input(s): vec: vector, na.rm: optional logical vector to check if there are missing values.
# output(s): as.numeric(percentile10): the tenth percentile of the input vector.
get_percentile10 <- function(vec, na.rm = FALSE){
  if(class(vec) != "numeric"){
    print("non-numeric argument")
    break
  }
  percentile10 <- quantile(vec, probs = 0.1, na.rm)
  return (as.numeric(percentile10))
}
get_percentile10(a, na.rm = TRUE)

# title: Get Ninetieth Percentile
# description: Takes a numeric vector with no missing values to compute its ninetieth percentile value.
# input(s): vec: vector, na.rm: optional logical vector to check if there are missing values.
# output(s): as.numeric(percentile10): the ninetieth percentile of the input vector.
get_percentile90 <- function(vec, na.rm = FALSE){
  if(class(vec) != "numeric"){
    print("non-numeric argument")
    break
  }
  percentile90 <- quantile(vec, probs = 0.9, na.rm)
  return (as.numeric(percentile90))
}
get_percentile90(a, na.rm = TRUE)

# title: Get First Quartile
# description: Takes a numeric vector and returns its first quartile.
# input(s): vec: numeric vecotr, na.rm: optional logical for missing values
# output(s): First quartile.
get_quartile1 <- function(vec, na.rm = FALSE){
  if(class(vec) != "numeric"){
    print("non-numeric argument")
    break
  }
  quartile1 <- quantile(vec, probs = 0.25, na.rm)
  return (as.numeric(quartile1))
}
get_quartile1(a, na.rm = TRUE)

# title: Get Third Quartile
# description: Takes a numeric vector and returns its third quartile.
# input(s): vec: numeric vector, na.rm: optional logical for missing values
# output(s): Third Quartile of Vector
get_quartile3 <- function(vec, na.rm = FALSE){
  if(class(vec) != "numeric"){
    print("non-numeric argument")
    break
  }
  quartile3 <- quantile(vec, probs = 0.75, na.rm)
  return (as.numeric(quartile3))
}
get_quartile3(a, na.rm = TRUE)

# title: Get Median Value
# description: Takes a numeric vector and returns its median value.
# input(s): vec: vector, na.rm: optional logical argument for missing values.
# output(s): med: median value of the vector
get_median <- function(vec, na.rm = FALSE){
  if(class(vec) != "numeric"){
    print("non-numeric argument")
    break
  } else if(na.rm == TRUE){
    vec <- remove_missing(vec)
  }
  sorted <- sort(vec)
  if(length(sorted) %% 2 == 0){
    med <- (sorted[length(sorted) / 2] + sorted[(length(sorted) / 2 + 1)]) / 2
    return (med)
  }
    med <- sorted[length(sorted) %% 2 + (length(sorted) - 1) / 2]
    return (med)
}
get_median(a, na.rm = TRUE)

# title: Get Average
# description: Takes numeric vector and returns its average.
# input(s): vec: numeric vector, na.rm: optional logical for missing values
# output(s): Average of numeric vector
get_average <- function(vec, na.rm = FALSE){
  sum <- 0
  if(class(vec) != "numeric"){
    print("non-numeric argument")
    break
  } else if(na.rm == TRUE){
    vec <- remove_missing(vec)
  }
  for(i in 1:length(vec)){
    sum <- sum + vec[i]
  }
  average <- sum / length(vec)
  return (average)
}
get_average(a, na.rm = TRUE)

# title: Get Standard Deviation
# description: Takes numeric vector and returns its standard deviation.
# input(s): vec: numeric vector, na.rm: optional logical for missing values
# output(s): Returns vector's standard deviation
get_stdev <- function(vec, na.rm = FALSE){
  sum <- 0
  if(class(vec) != "numeric"){
    print("non-numeric argument")
    break
  } else if(na.rm == TRUE){
    vec <- remove_missing(vec)
  }
  for(i in 1:length(vec)){
    sum <- sum + (vec[i] - get_average(vec, na.rm))^2
  }
  sd <- sqrt(sum / (length(vec) - 1))
  return (sd)
}
get_stdev(a, na.rm = TRUE)

# title: Count Missing Values
# description: Takes a numeric vector and returns how many missing values there are
# input(s): vec: numeric vector
# output(s): Return number of missing values
count_missing <- function(vec){
  count <- 0
    for(i in 1:length(vec)){
      if(is.na(vec[i]) == TRUE){
        count <- count + 1 
      }
    }
  return (count)
}
count_missing(a)

# title: Summary Statistics
# description: Takes a numeric vector and computes summary statistics for it=
# input(s): vec: numeric vector
# output(s): Return list of summary statistics
summary_stats <- function(vec, na.rm = FALSE){
  functions <- list(minimum = get_minimum(vec, na.rm), 
                    percent10 = get_percentile10(vec, na.rm), 
                    quartile1 = get_quartile1(vec, na.rm), 
                    median = get_median(vec, na.rm), 
                    mean = get_average(vec, na.rm), 
                    quartile3 = get_quartile3(vec, na.rm), 
                    percent90 = get_percentile90(vec, na.rm), 
                    maximum = get_maximum(vec, na.rm),
                    range = get_range(vec, na.rm), 
                    stdev = get_stdev(vec, na.rm), 
                    missing = count_missing(vec))
  return (lapply(length(vec), function(vec) functions))
}
names(summary_stats(a, na.rm = TRUE)[[1]][2])

# title: Print Statistics
# description: Takes the summary statistics and displays it nicely.
# input(s): stats: summary statistics list
# output(s): Returns a well laid out list of the summary statistics
print_stats <- function(stats){
  #paste(stats, sep = " ")
  sprintf("", 6)
}
vec <- summary_stats(a, na.rm = TRUE)
vec
new_number <- 0
new_name <- 0
for(i in 1:length(vec)){
  #new_number <- cat(new_number, vec[[1]][i])
  #new_name <- cat(new_name, names(vec[[1]][i]))
}
vec[[1]][2]
format(vec[1], digits = 3)
paste(names(summary_stats(a, na.rm = TRUE)[[1]][2]), "hi", collapse = "")
print_stats(summary_stats(a, na.rm = TRUE))

z="Hello"
b="EKA"
c=123456

sprintf("%s !! my name is %s and my number is %i", a, b, c)

# title: Drop lowest value
# description: Takes a numeric value and drops its lowest value
# input(s): vec: numeric vector
# output(s): Return vector without lowest value
drop_lowest <- function(vec){
  min <- get_minimum(vec)
  for(i in 1:length(vec)){
    if((vec[i] == min) == TRUE){
      vec <- vec[-i]
      return (vec)
    } 
  }
  return (vec)
}
b <- c(10, 10, 8.5, 4, 7, 9)
drop_lowest(b)

# title: Rescale to 100
# description: Rescales the vector to a scale on 100.
# input(s): x: vector, xmin: vector's lowest value, xmax: vector's highest value
# output(s): Rescaled vector on a scale on 100
rescale100 <- function(x, xmin, xmax){
  z <- 100 * (x - xmin) / (xmax - xmin)
  return (z)
}
b <- c(18,15,16,4,17,9)
rescale100(b, xmin = 0, xmax = 20)

# title: Score Homework
# description: Scores homework vector depending on whether the lowest score is dropped
# input(s): vec: numeric vector, drop: logical of whether lowest score dropped
# output(s): Return score of homeworks
score_homework <- function(vec, drop){
  if(drop == TRUE){
    vec <- drop_lowest(vec)
  } 
  average <- get_average(vec)
  return (average)
}
hws <- c(100, 80, 30, 70, 75, 85)
score_homework(hws, drop = TRUE)
score_homework(hws, drop = FALSE)

# title: Score Quiz
# description: Overall quiz score depending on whether lowest quiz dropped
# input(s): vec: numeric vector, drop: logical for whether lowest quiz is dropped
# output(s): Return score of quizzes
score_quiz <- function(vec, drop){
  if(drop == TRUE){
    vec <- drop_lowest(vec)
  } 
  average <- get_average(vec)
  return (average)
}
quizzes <- c(100,80,70,0)
score_quiz(quizzes, drop = TRUE)
score_quiz(quizzes, drop = FALSE)

# title: Score Lab
# description: Takes the number of attended labs and scores it based on a scale.
# input(s): attendance: number of attendance
# output(s): Return score of lab
score_lab <- function(attendance){
  if(attendance == 11 || attendance == 12){
    return (100)
  } else if (attendance == (10)){
    return (80)
  } else if (attendance == (9)){
    return (60)
  } else if (attendance == (8)){
    return (40)
  } else if (attendance == (7)){
    return (20)
  } else {
    return (0)
  }
}
score_lab(12)
score_lab(10)
score_lab(6)