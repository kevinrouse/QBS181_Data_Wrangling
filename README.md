# wranglinghub
Hi! This is our repository of our final project on the course QBS 181 Data Wrangling, taught by Dr. Carly Bobak in the Fall of 2022. 

### Contributors:
Anton Hung (email) - Anton.M.Hung.GR@dartmouth.edu - functions library + Anton folder

Joe Gyorda (joseph.a.gyorda.gr@dartmouth.edu) - all the files in the "Joe Code and Documentation" folder

Bofan (Will) Chen (bofan.chen.gr@dartmouth.edu) - all the files in the "Will" folder

Kevin Rouse (kevin.j.rouse.gr@dartmouth.edu) - all the files in the "Kevin's Excel" folder

Sean Pietrowicz (sean.w.pietrowicz.gr@dartmouth.edu) - webscraping.Rmd and weather_glossary.xlsx

--------------------------------------------------------------------------------------------------------------------------------
### Installation/Code Pipeline

#### Excel Cleaning
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


#### Tidyverse Cleaning
The tideverse cleaning basically reapeat the steps of Excel data cleaning but in R using the package tidyverse. Some functions are used: rename, ifelse, left_join. The detailed process is listed in the R and Rmd file.

CSV file that is used for tidyverse data cleaning, data analysis and modeling: football_data.csv, nfl_stadiums.csv, 
nfl_teams.csv, Merged_Stadium.csv

#### Word Cloud and Exploratory Data Analysis
The world cloud, a method of natural language processing, is used to visualize the variables containing text, including team_home, team_away, stadium and stadium_address. For stadium, we remove the words that are equal to or similiar to stadium, in order to analyze the descriptive word of the stadium, and the stadium.csv file is cleaned in Excel and used for the world cloud. The steps are showed in the Rmd file. 

In the exploratory data analysis (EDA), we conduct some visualizations using Tableau to further explore the dataset in terms of team, stadium and weather. The visualizations and dashboards are displayed in the EDA - Tableau.twb file.

#### Preliminary Analyses
Functions: functions_library.R
For our project, we chose to include a functions library, a separate R script containing all the functions in our code. This is useful because it reduces the amount of copying and pasting of our code. It also makes the document look more presentable when we aren’t taking up space with trivial bits of code
- All the code from missing_values.rmd (found in Anton's folder) was converted into functions, and these functions were moved to the functions_library.R
- The "source" method in R is used to import the function library into any r files that need it.
- inside the functions_library is also an early version of Joe's code, that was adapted to take advatange of the functions library.

Natural language processing (wordcloud): 181 FP Word Cloud.R

Tidyverse data cleaning: 181 FP Tidyverse.R

Missing value pipeline: Anton_documentation.Rmd (pages 1-4)
Almost every dataset will be missing some data. This section covers how we explored where we are missing data and how we handled it.
The library “naniar” contains many methods for visualizing which columns have missing data.
Later, in the web scraping section of the documentation, we describe how we imputed data into a new column to replace this “weather detail” column.
Also in this section, we identified that all of our meaningful betting data is found between the years 1978-present, and we chose not to include data outside of this range.

The effect of weather variables on the accuracy of the spread: Anton_documentation.Rmd (pages 5-end)
- This section demonstrates how we analyzed the weather data in our dataset to determine its effect on the accuracy of the spread.
- This is achieved by creating visualizations of our weather variables: temperature, wind, and humidity. These variables are compared against the accuracy of the spread.

#### Advanced Modeling
All code and documentation can be found in the folder "Joe Code and Documentation" which contains and RMD and knitted PDF of this document.

Download the "Joe_QBS_181_Project_Code.rmd" file to your local computer along with the cleaned dataset titled 'Merged_Stadium.csv' which was extracted from the final step in Kevin's Excel workbook. The code walks through some preliminary data cleaning, along with implementing a linear mixed model and a network analysis.

#### Web Scraping
Web scraping documentation and code can be found within the file "webscraping.Rmd" which contains all of the information for pulling weather data from nflweather.com as well as information about how to merge this scraped data into the main project dataset. 

This script runs alongside the file "weather_glossary.xlsx" which contains our team's ratings for weather severity and is used for the preliminary linear mixed-effects model that employs this scraped weather data to determine if weather conditions are a factor in spread accuracy.
