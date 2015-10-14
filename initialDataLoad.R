library("twitteR")
library("ROAuth")
library(wordcloud)

consumer_key='YjE9pZ8jm1VMngQ1SGfd2ZHRe'
consumer_secret='Sq8qQZbB9VJ9Erib1UOKSncnY9iUzjHQ358JgZRulLEbWnbIG6'
access_token='49888991-BtYtr2pEFbZeC3AJsAY5stJ2sMefZKrvJdK5djYYV'
access_secret='MjkdfExpk5U8nHfXB9FU8jpJNofbFptnRdh9MZWWiEVRB'

setup_twitter_oauth(consumer_key, consumer_secret, access_token=access_token, access_secret=access_secret)

# search.string <- "@HillaryClinton OR @realDonaldTrump OR @RealBencarson OR @JebBush OR @GovChristie OR @tedcruz OR @CarlyFiorina OR GovMikeHuckabee OR BobbyJindal OR @JohnKasich OR @RandPaul OR @ScottWalker OR @RickSantorum OR @marcorubio"
search.string <- "@HillaryClinton"
no.of.tweets <- 10

#tweets<-searchTwitter(search.string, n=no.of.tweets, since='2015-01-01', until='2015-01-31')
tweets<-searchTwitter(search.string, n=no.of.tweets)

df <- do.call("rbind", lapply(tweets, as.data.frame))

write.csv(df,file="twitterList.csv")