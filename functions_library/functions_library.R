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


############## Missing value markdown
plot_playing_surface <- function(dataset){
  surface_data <- filter(dataset, 
                         stadium_surface=='FieldTurf' |
                           stadium_surface=='Hellas Matrix Turf' |
                           stadium_surface=='Grass')
  
  ggplot(data=surface_data, aes(x=stadium_surface, y=`Actual difference - spread`, color=stadium_surface, fill=stadium_surface)) +
    geom_boxplot() +
    labs(title="Accuracy of the spread vs stadium surface played on",
         x = "Stadium surface") +
    theme_light() +
    theme(legend.position="none", text = element_text(size=12)) +
    scale_fill_manual(values = c("#ffffcc", "#a1dab4", "#41b6c4")) +
    scale_color_manual(values = c("#a1dab4", "#41b6c4", "#2c7fb8"))
}

plot_stadium_weather <- function(dataset){
  df <- dataset[complete.cases(dataset$stadium_weather_type), ]
  
  
  ggplot(data=df, aes(x=stadium_weather_type, 
                      y=`Actual difference - spread`, 
                      color=stadium_weather_type, 
                      fill=stadium_weather_type)) +
    geom_violin() +
    geom_boxplot(width=0.1) +
    labs(title="Accuracy of the spread vs weather type at the stadium",
         x = 'Stadium Weather Type') +
    theme_light() +
    theme(legend.position="none", text = element_text(size=12)) +
    scale_fill_manual(values = c("#ffffcc", "#a1dab4", "#41b6c4", "#225ea8")) +
    scale_color_manual(values = c("#a1dab4", "#41b6c4", "#2c7fb8", "#253494"))
}

plot_weather_status <- function(dataset){
  bad_weather_days <- filter(dataset, 
                             stadium_weather_type != 'dome' &
                               weather_temperature <= 45 &
                               weather_wind_mph >= 12)
  
  weather_status <- ifelse(dataset$stadium_weather_type != 'dome' &
                             dataset$weather_temperature <= 45 &
                             dataset$weather_wind_mph >= 12, 
                           'Bad weather', 'Good weather')
  
  
  data_weather_categorized <- add_column(dataset, weather_status)
  
  data_weather_categorized <- data_weather_categorized[complete.cases(data_weather_categorized$weather_status),]
  
  ggplot(data=data_weather_categorized, aes(x=weather_status, 
                                            y=`Actual difference - spread`, 
                                            color=weather_status, 
                                            fill=weather_status)) +
    geom_violin() +
    geom_boxplot(width=0.1) +
    labs(title="Accuracy of the spread vs weather type at the stadium",
         x = 'Weather status') +
    theme_light() +
    theme(legend.position="none", text = element_text(size=12)) +
    scale_fill_manual(values = c("#ffffcc", "#a1dab4")) +
    scale_color_manual(values = c("#a1dab4", "#41b6c4"))
}