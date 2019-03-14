library(tm)

# creates corpus
docs <- Corpus(DirSource("~/documents/github/evelina/Burney Project"))

# Checks corpus
inspect(docs)

# Remove punctuation - replace punctuation marks with " "
docs <- tm_map(docs, removePunctuation)

# Transform to lower case
docs <- tm_map(docs,content_transformer(tolower))

# Strip digits
docs <- tm_map(docs, removeNumbers)

# added a few other common ones that got through...
> all_stops <- c("the", "Cecilia", "Camilla", "Evelina", stopwords("en"))

# and stripped everything from docs.
docs <- tm_map(docs, removeWords, all_stops)

# Strip whitespace 
docs <- tm_map(docs, stripWhitespace)

# inspect output
writeLines(as.character(docs))

# creates document term matrix
dtm <- DocumentTermMatrix(docs)

# frequency of occurence of each word in the corpus
freq <- colSums(as.matrix(dtm))

# Creates descending sort order 
ord <- order(freq,decreasing=TRUE)


# finds and displays the frequency of terms
findFreqTerms(dtm,lowfreq=80)

# creates wf, note that due to the sheer volume of words we have to increase freq to 550 in order for the graph to make any sense
wf <- data.frame(term=names(freq), occurences=freq)

p <- ggplot(subset(wf, freqr>550), aes(term, occurrences))
p <- p + geom_bar(stat="identity”)
p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))
p

#now a word cloud.

library(wordcloud)
