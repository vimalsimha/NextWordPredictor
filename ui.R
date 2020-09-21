# User Interface for Word Predictor

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Word Predictor"),
  
  #Text Input
  sidebarLayout(
    sidebarPanel(
      textInput("text", label = h4("Text input"), value = "Enter Text Here"),
    submitButton("Predict"),
    #actionButton("button", "Predict"),
    width = 10),
  
  mainPanel(
    #Text Output
    tabsetPanel (type = "tabs",
    tabPanel("Predictor",br(),h3("The Next Word Is:"),
    textOutput("outtext")),
    tabPanel ("Help",br(),h3("Help"),
              p("Enter a set of words and click on Predict to predict the next word. Please
                 avoid punctuation marks or numbers.")
              ),
    tabPanel ("About" , br(), h3("About"),
              p("Author: Vimal Simha"),
              p("This App predicts the next word based on n-gram analysis."),
              p("The Source Code can be found",a(href="https://github.com/vimalsimha/nlpwordpredictor","here")),
              p("The training data can be found",a(href="https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip","here"))
              )

    )
  )
  )
  
  
)
)
