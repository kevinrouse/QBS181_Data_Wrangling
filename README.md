# wranglinghub
Hi! This is our repository of our final project on the course QBS 181 Data Wrangling, taught by Dr. Carly Bobak in the Fall of 2022. 

### Contributors:
Anton Hung (email) - xxxxxx

Joe Gyorda (joseph.a.gyorda.gr@dartmouth.edu) - all the files in the "Joe Code and Documentation" folder

Bofan (Will) Chen (email) - xxxxx

Kevin Rouse (email) - (kevin.j.rouse.gr@dartmouth.edu) - all the files in the "Kevin's Excel" folder

Sean Pietrowicz (email) - xxxxx

--------------------------------------------------------------------------------------------------------------------------------
### Installation/Code Pipeline

#### Excel cleaning
Kevin to fill

Excel file with data cleaning steps: football_data.xlsx
Brief Overview(Look at Excel Sheet metadata sheet for further detail):
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
Joe to add description
Joe_QBS_181_Project_Code.Rmd

#### Web scraping
Sean to fill
