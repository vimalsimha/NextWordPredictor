# Word Predictor

library(shiny)
source("wordpred.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  predword <- reactive({
    predword <- predictword(input$text)
  })
  
  output$outtext = renderText({predword()})
  
  #output$outtext = renderText({input$text})

})
