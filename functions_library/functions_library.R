library(lme4)
library(car)
library(MuMIn)
library(tidyverse)
library(ggplot2)

filter_by_spread <- function(spread_param){
  football_data_filter %>% 
    group_by(team_home) %>%
    summarise(Spread_Correct=sum(Actual.difference...spread==0)/
                length(Actual.difference...spread) * 100) %>% 
    arrange(desc(spread_param))
}

filter_by_spread_combined <- function(dataset){
  dataset %>% 
    group_by(team_home) %>% 
    summarise(Over_Spread=sum(Actual.difference...spread>0)/
                length(Actual.difference...spread) * 100,
              Under_Spread=sum(Actual.difference...spread<0)/
                length(Actual.difference...spread) * 100,
              Spread_Correct=sum(Actual.difference...spread==0)/
                length(Actual.difference...spread) * 100) %>% 
    gather(SpreadType, Percent, Over_Spread:Spread_Correct)
}

plot_spreadtype <- function(dataset){
  ggplot(data=dataset,aes(team_home,fill=SpreadType)) + 
    geom_bar(aes(weight=Percent),position="stack") +
    theme(axis.text.x = element_text(angle = 90)) +
    ylab("Percent") +
    geom_text(position="stack",aes(team_home,Percent+1,label=round(Percent,1)),size=2) +
    ggtitle("Accuracy of Spread Across NFL History for Each NFL Team")
}


view_spread_accuracy <- function(dataset){
  dataset %>% 
    group_by(schedule_season) %>% 
    summarise(Avg_Diff=mean(Actual.difference...spread),SD_Diff=sd(Actual.difference...spread),
              Med_Diff=median(Actual.difference...spread))
}  

plot_spread_accuracy <- function(dataset) {
  ggplot(data=dataset, aes(x=schedule_season, y=Avg_Diff)) +
    geom_line()+
    geom_point()+
    geom_hline(yintercept=0, linetype='dotted', col = 'red') +
    geom_line(aes(y = (Avg_Diff+SD_Diff)), color="steelblue", linetype="twodash") +
    geom_line(aes(y = (Avg_Diff-SD_Diff)), color="steelblue", linetype="twodash") 
}

assess_normality <- function(dataset){
  par(mfrow=c(1,3))
  hist(dataset$Actual.difference...spread)
  boxplot(dataset$Actual.difference...spread)
  qqPlot(dataset$Actual.difference...spread)
}
