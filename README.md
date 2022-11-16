# wranglinghub
Hi! This is our repository of our final project on the course QBS 181 Data Wrangling, taught by Dr. Carly Bobak in the Fall of 2022. 

### Contributors:
Anton Hung (email) - xxxxxx

Joe Gyorda (joseph.a.gyorda.gr@dartmouth.edu) - all the files in the "Joe Code and Documentation" folder

Bofan (Will) Chen (bofan.chen.gr@dartmouth.edu) - xxxxx

Kevin Rouse (kevin.j.rouse.gr@dartmouth.edu) - all the files in the "Kevin's Excel" folder

Sean Pietrowicz (email) - xxxxx

--------------------------------------------------------------------------------------------------------------------------------
### Installation/Code Pipeline

#### Excel cleaning
Excel file with data cleaning steps: football_data.xlsx
Brief Overview (Look at Excel Sheet metadata sheet for further detail):
Added abbreviations to home, away team to match up with spread team formatting 
(used VLOOKUPs)

Found the point difference between the favored team and other team

Created a column called Difference_favored_minus_notfavored which is how the 
favored team compared against the spread using an IF statement (Based on if
favored team is home or away)

Created a column called Actual total-over/under, which was the difference in the
actual total points scored in the game and the predicted

Merged stadium and team data onto main sheet


#### Tidyverse cleaning
Anton and will to fill

CSV file that is used for tidyverse data cleaning, data analysis and modeling: football_data.csv, nfl_stadiums.csv, 
nfl_teams.csv, Merged_Stadium.csv

#### Preliminary Analyses
Functions: functions_library

Natural language processing (wordcloud): 181 FP Word Cloud.R

Tidyverse data cleaning: 181 FP Tidyverse.R

Missing value pipeline: missing_values.Rmd

#### Advanced Modeling
All code and documentation can be found in the folder "Joe Code and Documentation" which contains and RMD and knitted PDF of this document.

Download the "Joe_QBS_181_Project_Code.rmd" file to your local computer along with the cleaned dataset titled 'Merged_Stadium.csv' which was extracted from the final step in Kevin's Excel workbook. The code walks through some preliminary data cleaning, along with implementing a linear mixed model and a network analysis.

#### Web scraping
Web scraping documentation and code can be found within the file "webscraping.Rmd" which contains all of the information for pulling weather data from nflweather.com as well as information about how to merge this scraped data into the main project dataset. 

This script runs alongside the file "weather_glossary.xlsx" which contains our team's ratings for weather severity and is used for the preliminary linear mixed-effects model that employs this scraped weather data to determine if weather conditions are a factor in spread accuracy.
