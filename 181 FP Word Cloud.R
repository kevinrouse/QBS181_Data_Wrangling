if (!require("RColorBrewer")) {
  install.packages("RColorBrewer")
  library(RColorBrewer)
}
library(RColorBrewer)
# install.packages("wordcloud")
library(wordcloud)
library(SnowballC)
#install.packages("tm")
library(tm)


#install.packages("wordcloud2")
#library(wordcloud2)

# Visualize team_home
team_home <- merged_teams$team_home
team_home <- Corpus(VectorSource(team_home))
# Create a new blank canvas for word cloud plot
dev.new(width = 2000, height = 2000, unit = "px")
# Word cloud plot
wordcloud(team_home
          , scale=c(5,0.5)     # Set min and max scale
          , max.words=100      # Set top n words
          , random.order=FALSE # Words in decreasing freq
          , rot.per=0.35       # % of vertical words
          , use.r.layout=FALSE # Use C++ collision detection
          , colors=brewer.pal(8, "Dark2"))



# Visualize stadium
stadium <- read.csv("/Users/william/Library/Mobile Documents/com~apple~CloudDocs/QBS 181/stadium.csv")
# remove Stadium, Filed, Bowl, County, Memorial, Municipal, Coliseum, Dome, Superdome, Metrodome, Silverdome in Excel
stadium <- Corpus(VectorSource(stadium$stadium))


dev.new(width = 2000, height = 2000, unit = "px")
wordcloud(stadium
          , scale=c(3.5,0.2)     # Set min and max scale
          , max.words=100      # Set top n words
          , random.order=FALSE # Words in decreasing freq
          , rot.per=0.15       # % of vertical words
          , use.r.layout=FALSE # Use C++ collision detection
          , colors=brewer.pal(8, "Dark2"))


# Visualiaze team_away
team_away <- merged_teams$team_away
team_away <- Corpus(VectorSource(team_away))

dev.new(width = 2000, height = 2000, unit = "px")
wordcloud(team_away
          , scale=c(5,0.5)     # Set min and max scale
          , max.words=100      # Set top n words
          , random.order=FALSE # Words in decreasing freq
          , rot.per=0.35       # % of vertical words
          , use.r.layout=FALSE # Use C++ collision detection
          , colors=brewer.pal(8, "Dark2"))


# Visualiaze stadium_address
stadium_address <-  merged_teams$stadium_address
stadium_address <- Corpus(VectorSource(stadium_address))
# Convert to lowercase
stadium_address <- tm_map(stadium_address, tolower)
# Remove conjunctions etc.
stadium_address <- tm_map(stadium_address, removeWords, stopwords("english"))
# Remove suffixes to the common 'stem'
stadium_address <- tm_map(stadium_address, stemDocument)
# Remove commas etc.
stadium_address <- tm_map(stadium_address, removePunctuation)

dev.new(width = 2000, height = 2000, unit = "px")
wordcloud(stadium_address
          , scale=c(5,0.5)     # Set min and max scale
          , max.words=100      # Set top n words
          , random.order=FALSE # Words in decreasing freq
          , rot.per=0.35       # % of vertical words
          , use.r.layout=FALSE # Use C++ collision detection
          , colors=brewer.pal(8, "Dark2"))
