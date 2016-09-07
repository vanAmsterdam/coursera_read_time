library(shiny)
library(data.table)

screened <- read.csv("data/screening_time.csv", header = T, row.names = NULL)
colnames(screened) <- c("index", tail(colnames(screened), -1))
screened <- data.table(screened)
attach(screened)

shinyServer(function(input, output) {

  output$fitPlot <- renderPlot({
          # fit a model, based on the user provided degree
          fit <- lm(read_time ~ poly(index, input$degree))
          # plot it against the actual values
          plot(read_time, main = 'read time by index, with regression line')
          lines(x = index, y = fit$fitted.values, col = "red", lwd = 3)
  })
  
})
