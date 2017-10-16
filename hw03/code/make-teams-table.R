# ================================================================
# title: make-teams-table
# description: data preparation to create new csv file containing 
#              required variables to be used in ranking analysis
# input(s): nba2017-roster.csv nba2017-stats.csv
# output(s): nba2017-cleanroster.csv nba2017-cleanstats.csv teams_star_plot.pdf experience_salary.pd
# ================================================================

#Raw Data and dictionaries
library(readr)
library(dplyr)
library(ggplot2)
roster <- read_csv("./nba2017-roster.csv", col_types = cols(
                  position = col_factor(c("C", "PG", "SF", "PF", "SG"))))
stats <- read_csv("./nba2017-stats.csv")

roster
stats
colnames(stats)
colnames(roster)

#Adding new variables
stats <- mutate(stats, 
       missed_fg = field_goals_atts - field_goals_made,
       missed_ft = points1_atts - points1_made, 
       points = 3*points3_made + 2*points2_made + points1_made,
       rebounds = off_rebounds + def_rebounds,
       efficiency = (points + rebounds + assists + steals +
                    blocks - missed_fg - missed_ft - 
                    turnovers) / games_played)

sink(file = '../output/summary-height-weight.txt')
summary(stats$efficiency)
sink()

#Merging Tables
teams <- roster %>% 
  merge(stats)

#Creating nba2017-teams.csv
teams$salary <- round(teams$salary / 1000000, 2)
teams <- teams %>% 
  group_by(team) %>%
  summarise(experience = sum(experience),
            salary = sum(salary),
            points3 = sum(points3_made),
            points2 = sum(points2_made),
            free_throws = sum(points1_made),
            points = sum(points),
            off_rebounds = sum(off_rebounds),
            def_rebounds = sum(def_rebounds),
            assists = sum(assists),
            steals = sum(steals),
            blocks = sum(blocks),
            turnovers = sum(turnovers),
            fouls = sum(fouls),
            efficiency = sum(efficiency))

summary(teams)
teams
sink(file = "./teams-summary.txt")
summary(teams)
sink()

write.csv(teams, file = "./nba2017-teams.csv", row.names = FALSE)

pdf(file = "../images/teams_star_plot.pdf", width = 7, height = 5)
stars(teams[ ,-1], labels = teams$team)
dev.off()

pdf(file = "../images/experience_salary.pdf", width = 8, height = 7)
ggplot(teams, aes(experience, salary)) + geom_point(aes(color = team)) + 
                                         geom_text(aes(label = team), size = 2)
dev.off()

