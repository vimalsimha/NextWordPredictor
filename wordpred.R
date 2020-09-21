library(dplyr)
library(tidytext)
library(tidyverse)
library(tidyr)
library(utils)

# Functions to predict next word using unigram, bigram, trigram and quadgram
# Each function takes in the user input and returns the most probable following word

bigrampred <- function(wordsin)
{
  bigrams  <- read_csv("bigrams.dat")
  n<-length(wordsin$word)
  last_word <- wordsin$word[n]
  bipred  <- bigrams %>% separate(word, c("word1", "word2"), sep = " ") %>% filter(word1 == last_word)
  bigrampred <- bipred$word2[1]
  
}

trigrampred <- function(wordsin)
{
  
  trigrams <- read_csv("trigrams.dat")
  n<-length(wordsin$word)
  last_word <- wordsin$word[n]
  last_1word <- wordsin$word[n-1]
  trisep  <- trigrams %>% separate(word, c("word1", "word2","word3"), sep = " ") 
  tripred <- trisep %>% filter(word1 == last_1word & word2 == last_word)
  trigrampred <- tripred$word3[1]
  
}

quadgrampred <- function(wordsin, quadgrams)
{
  
  quadgrams <- read_csv("quadgrams.dat")
  n<-length(wordsin$word)
  last_word <- wordsin$word[n]
  last_1word <- wordsin$word[n-1]
  last_2word <- wordsin$word[n-2]
  quadpred  <- quadgrams %>% separate(word, c("word1", "word2","word3","word4"), sep = " ") %>%
    filter(word1 == last_2word & word2 == last_1word & word3 == last_word)
  quadgrampred <- quadpred$word4[1]
  
}

unigrampred <- function(wordsin)
{
  unigrams <- read_csv("unigrams.dat")
  unigrampred <- unigrams$word[1]
}

wordsin <- function(textinput)
{
  textin <- tibble(data=textinput)
  wordsin <- textin %>% unnest_tokens(word,data)
}

predictword <- function(textinput)
{
  
  g <- getwd()
  print(g)
  
  wordsin <- wordsin(textinput)
  #Find number of words in input
  n = length(wordsin$word)
  
  isna = 0  # isna=1 if no prediction match
  
  if(n>2) 
  {
      preds <- quadgrampred(wordsin)
      if(is.na(preds[1])) {isna = 1} else {isna = 0}
  }
  
  if(n==2 | isna==1)
  {
    preds <- trigrampred(wordsin)
    if(is.na(preds[1])) {isna = 1} else {isna = 0}
  }
  
  if(n==1 | isna==1)
  {
    preds <- bigrampred(wordsin)
    if(is.na(preds[1])) {isna = 1} else {isna = 0}
  }

  if(isna==1 | n==0)  
  {
    preds <- unigrampred(wordsin)
  }
  
 
  
  predictword <- preds   
  
}