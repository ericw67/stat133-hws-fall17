# ================================================================
# title: Clean Data Script
# description: Data Preparation of raw scores into clean scores
# input(s): rawscores.csv
# output(s): cleanscores.csv
# ================================================================

library(readr)
source(file = "./stat133/stat133-hws-fall17/hw04/code/functions.R")
raw_scores <- read_csv(file = "./stat133/stat133-hws-fall17/hw04/data/rawdata/rawscores.csv")

sink(file = './stat133/stat133-hws-fall17/hw04/output/summary-rawscores.txt')
str(raw_scores)
sink()

clean_scores <- raw_scores

# Replacing NA with 0
for(i in 1:ncol(clean_scores)){
  for(j in 1:nrow(clean_scores)){
    if(is.na(clean_scores[j,i]) == TRUE){
      clean_scores[j,i] <- 0
    }
  }
}

# Rescale QZ1 out of 100
clean_scores$QZ1 <- round(rescale100(clean_scores$QZ1, xmin = 0, xmax = 12), 2)

# Rescale QZ2 out of 100
clean_scores$QZ2 <- round(rescale100(clean_scores$QZ2, xmin = 0, xmax = 18), 2)

# Rescale QZ3 out of 100
clean_scores$QZ3 <- round(rescale100(clean_scores$QZ3, xmin = 0, xmax = 20), 2)

# Rescale QZ4 out of 100
clean_scores$QZ4 <- round(rescale100(clean_scores$QZ4, xmin = 0, xmax = 20), 2)

# Add variable Test1 from rescaling EX1 out of 80
clean_scores <- mutate(clean_scores, 
                     Test1 = round(rescale100(clean_scores$EX1, xmin = 0, xmax = 80), 2))

# Add variable Test2 from rescaling EX2 out of 90
clean_scores <- mutate(clean_scores,
                     Test2 = round(rescale100(clean_scores$EX2, xmin = 0, xmax = 90), 2))

# Add variable Homework for overall homework score with dropped lowest score
individual_hwscores <- 0
hw_scores <- 0
for(i in 1:nrow(clean_scores)){
  for(j in 1:9){
    individual_hwscores[j] <- as.numeric(clean_scores[i,j])
  }
  hw_scores[i] <- score_homework(individual_hwscores, drop = TRUE)
}
clean_scores <- mutate(clean_scores,
                     Homework = hw_scores)
clean_scores$Homework
# Add variable Quiz for overall quiz score with dropped lowest score
individual_quizscores <- 0
quiz_scores <- 0
index <- 1
for(i in 1:nrow(clean_scores)){
  for(j in 11:14){
    individual_quizscores[index] <- as.numeric(clean_scores[i,j])
    index <- index + 1
  }
  index <- 1
  quiz_scores[i] <- score_quiz(individual_quizscores, drop = TRUE)
  individual_quizscores <- 0
}

clean_scores <- mutate(clean_scores,
                     Quiz = quiz_scores)

# Add Overall overall score to dataframe
lab_scores <- 0
for(i in 1:nrow(clean_scores)){
  lab_scores[i] <- score_lab(clean_scores[i, "ATT"])
}

clean_scores <- mutate(clean_scores,
                     Lab = lab_scores)

clean_scores <- mutate(clean_scores,
                     Overall = Lab*.1 +
                               Homework*.3 +
                               Quiz*.15 +
                               Test1*.2 +
                               Test2*.25)
# Add variable Grade to dataframe
letter <- 0
for(i in 1:nrow(clean_scores)){
  if(clean_scores[i, "Overall"] >= 95 && clean_scores[i, "Overall"] <= 100){
    letter[i] <- "A+"
  } else if(clean_scores[i, "Overall"] >= 90 && clean_scores[i, "Overall"] < 95){
    letter[i] <- "A"
  } else if(clean_scores[i, "Overall"] >= 88 && clean_scores[i, "Overall"] < 90){
    letter[i] <- "A-"
  } else if(clean_scores[i, "Overall"] >= 86 && clean_scores[i, "Overall"] < 88){
    letter[i] <- "B+"
  } else if(clean_scores[i, "Overall"] >= 82 && clean_scores[i, "Overall"] < 86){
    letter[i] <- "B"
  } else if(clean_scores[i, "Overall"] >= 79.5 && clean_scores[i, "Overall"] < 82){
    letter[i] <- "B-"
  } else if(clean_scores[i, "Overall"] >= 77.5 && clean_scores[i, "Overall"] < 79.5){
    letter[i] <- "C+"
  } else if(clean_scores[i, "Overall"] >= 70 && clean_scores[i, "Overall"] < 77.5){
    letter[i] <- "C"
  } else if(clean_scores[i, "Overall"] >= 60 && clean_scores[i, "Overall"] < 70){
    letter[i] <- "C-"
  } else if(clean_scores[i, "Overall"] >= 50 && clean_scores[i, "Overall"] < 60){
    letter[i] <- "D"
  } else {
    letter[i] <- "F"
  }
}

clean_scores <- mutate(clean_scores, 
                     Grade = letter)

# Sinking summary statistics
sink(file = './stat133/stat133-hws-fall17/hw04/output/Lab-stats.txt')
summary_stats(clean_scores$Lab)
#print_stats(clean_scores)
sink()

sink(file = './stat133/stat133-hws-fall17/hw04/output/Homework-stats.txt')
summary_stats(clean_scores$Homework)
#print_stats(clean_scores)
sink()

sink(file = './stat133/stat133-hws-fall17/hw04/output/Quiz-stats.txt')
summary_stats(clean_scores$Quiz)
#print_stats(clean_scores)
sink()

sink(file = './stat133/stat133-hws-fall17/hw04/output/Test1-stats.txt')
summary_stats(clean_scores$Test1)
#print_stats(clean_scores)
sink()

sink(file = './stat133/stat133-hws-fall17/hw04/output/Test2-stats.txt')
summary_stats(clean_scores$Test2)
#print_stats(clean_scores)
sink()

sink(file = './stat133/stat133-hws-fall17/hw04/output/Overall-stats.txt')
summary_stats(clean_scores$Overall)
#print_stats(clean_scores)
sink()

sink(file = './stat133/stat133-hws-fall17/hw04/output/summary-cleanscores.txt')
str(clean_scores)
sink()

write.csv(clean_scores, file = './stat133/stat133-hws-fall17/hw04/data/cleandata/cleanscores.csv')

