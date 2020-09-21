# readwritefiles.R
# Code to read corpora files, create subsample and write it to file for future use.

#Read Data Files
## Provide the path if your data is located elsewhere
News <- readLines("en_US.news.txt")
Twitter <- readLines("en_US.twitter.txt")
Blogs <- readLines("en_US.blogs.txt")

set.seed(100)
#Subsample
sample_size=0.1 # Subsample size fraction - can be modified to change size of subsample
subTwitter <- sample(Twitter, size = length(Twitter)*sample_size, replace = TRUE)
subBlogs <- sample(Blogs, size = length(Blogs)*sample_size, replace = TRUE)
subNews <- sample(News, size = length(News)*sample_size, replace = TRUE)

Csub <- c(subTwitter,subBlogs,subNews)
writeLines(Csub,"Subsample.txt")
