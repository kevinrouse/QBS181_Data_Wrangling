
spreads <- read.csv("/Users/william/Library/Mobile Documents/com~apple~CloudDocs/QBS 181/spreadspoke_scores.csv")
stadiums <- read.csv("/Users/william/Library/Mobile Documents/com~apple~CloudDocs/QBS 181/nfl_stadiums.csv")
teams <- read.csv("/Users/william/Library/Mobile Documents/com~apple~CloudDocs/QBS 181/nfl_teams.csv")

summary(spreads)
summary(stadiums)
summary(teams)

library(tidyverse)


# Adding Abbreviations
df1 <- teams[,c("team_name", "team_id")]
df1 <- df1 %>% rename(team_home=team_name)
spread1 <- left_join(spreads, df1, by="team_home")

# Difference Favored
spread1$difference_favored_minus_notfavored <- ifelse(spread1$team_id == spread1$team_favorite_id, spread1$score_home-spread1$score_away, spread1$score_away-spread1$score_home)

# Comparing Spread
spread1$abs_spread <- abs(spread1$spread_favorite)
spread1$actual_diff_spread <- spread1$difference_favored_minus_notfavored - spread1$abs_spread

# Comparing Over Under
spread1$actual_total_over_under <- (spread1$score_home + spread1$score_away) - spread1$over_under_line

# Merge Stadium
stadiums<- stadiums %>% rename(stadium=stadium_name)
merged_stadiums <- left_join(spread1, stadiums, by="stadium")

# Merge Teams
df2 <- teams[,c("team_name", "team_conference", "team_division", "team_conference_pre2002", "team_division_pre2002")]
df2 <- df2 %>% rename(team_home=team_name)
merged_teams <- left_join(merged_stadiums, df2, by="team_home")





  
