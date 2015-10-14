library(tm)
library(SnowballC)

vc.corpus <- VCorpus(DirSource(".\\allData", encoding = "UTF-8"))

#vc.corpus <-  tm_map(vc.corpus, removePunctuation)
vc.corpus <-  tm_map(vc.corpus,tolower)
vc.corpus <- tm_map(vc.corpus, PlainTextDocument)

vc.corpus <-  tm_map(vc.corpus, stripWhitespace)

vc.corpus <-  tm_map(vc.corpus, stemDocument)

vc.corpus <-  tm_map(vc.corpus, removeWords, stopwords("english"))

tdm.vc.corpus <- TermDocumentMatrix(vc.corpus)

#inspect corpus for 2016 Election Issues
# internationalIssues <- c("Foreign Policy", "Homeland Security", "War & Peace", "Free Trade", "Immigration", "Energy & Oil")
# internationalIssues <- c("Foreign", "Homeland", "Security", "War", "Trade", "Immigration", "Energy", "Oil")
domesticIssues <- c("guns", "crime", "drug", "health", "technology", "environment")

inspect(TermDocumentMatrix(vc.corpus,list(dictionary = domesticIssues)))


