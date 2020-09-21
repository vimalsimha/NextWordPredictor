# cleandata.R
# Code to clean sampled dataset and create ngrams

library(dplyr)
library(tidytext)
library(tidyr)

# Read in subsample
Csub <- readLines("Subsample.txt")
sample <- tibble(data=Csub)

# unnest_tokens coverts to lowercase and removes punctuation automatically
# Code below will remove numbers and profanities while creating ngrams

bw <- readLines("badwords.txt")
#This file was downloaded from the google bad words database
bw <- tibble(word=bw)

# Create Unigram

unigrams <- sample %>% unnest_tokens(word,data)
unigrams <- unigrams %>% anti_join(bw)
unigrams <- unigrams[-grep("[0-9]",unigrams$word),]
unigrams_sorted <- unigrams %>% count(word,sort=TRUE) %>% filter(n>10000)
write.csv(unigrams_sorted,"unigrams.dat")

# Create bigram

bigrams <- sample %>% unnest_tokens(word, data, token = "ngrams", n = 2)
bigrams <- bigrams %>% anti_join(bw)
bigrams <- bigrams[-grep("[0-9]",bigrams$word),]
bigrams_sorted <- bigrams %>% count(word,sort=TRUE) %>% filter(n>10)
write.csv(bigrams_sorted,"bigrams.dat")

# Create trigram

trigrams <- sample %>% unnest_tokens(word, data, token = "ngrams", n = 3)
trigrams <- trigrams %>% anti_join(bw)
trigrams <- trigrams[-grep("[0-9]",trigrams$word),]
trigrams_sorted <- trigrams %>% count(word,sort=TRUE) %>% filter(n>10)
write.csv(trigrams_sorted,"trigrams.dat")

# Create quadgram

quadgrams <- sample %>% unnest_tokens(word, data, token = "ngrams", n = 4)
quadgrams <- quadgrams %>% anti_join(bw)
quadgrams <- quadgrams[-grep("[0-9]",quadgrams$word),]
quadgrams_sorted <- quadgrams %>% count(word,sort=TRUE) %>% filter(n>10)
write.csv(quadgrams_sorted,"quadgrams.dat")



