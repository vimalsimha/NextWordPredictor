Next Word Predictor
================

Next Word Predictor is a software package that predicts the next word in a sentence using Natural Language Processing (NLP) techniques, specifically n-gram and backoff models. In short, it predicts the next word using the information from the previous few words.

App
---

I have packaged the prediction algorithm into an [app](https://vimalsimha.shinyapps.io/wordpredictor/) with a user friendly, accessible interface. Enter a set of words and click on *Predict* to predict the next word.

Code
----

-   **readwritefiles.R**: Reads in the training data and creates a subsample.

-   **cleandata.R**: Cleans the data, creates n-grams and writes them to file.

-   **wordpred.R**: Functions to reads n-grams and input words and generate a prediction for the next word.

-   **ui.R & server.R**: Code to build the Shiny App for the user-interface.

Data
----

-   The data are collected from publicly available sources using a web crawler. They consist of sentences from news reports, blogs and twitter feeds in three different files. For this project, I only use the English language files. The data are available [here](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip).

-   For this project, we only use the English language files, so you will need the following files:

    -   final/en\_US/en\_US.news.txt
    -   final/en\_US/en\_US.blogs.txt
    -   final/en\_US/en\_US.twitter.txt

-   In addition, badwords.txt downloaded from the [google bad words database](https://code.google.com/archive/p/badwordslist/downloads) is provided for filtering profanities.

-   N-grams generated by cleandata.R are pre-packaged and provided here to speed up the app. These files are unigrams.dat, bigrams.dat, trigrams.dat and quadgrams.dat.

Instructions
------------

-   Download all the files and run the following commands in RStudio:

        library(shiny)
        runApp("Path to directory downloaded")

    This will run the Next Word Predictor App using the pre-packaged n-grams provided.

-   To generate the n-grams yourself with the same or different parameters:
    -   Download the data files and badwords.txt to the same folder as the other files.
    -   Run readwritefiles.R followed by cleandata.R
-   You will require the following packages - dplyr, tidytext, tidyverse, tidyr, utils and shiny

Presentation
------------

A short presentation about Next Word Predictor with more details about the algorithm can be found [here](https://rpubs.com/vimalsimha/nlpwordpredictor).
