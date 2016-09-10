library(shiny)
library(data.table)

screened <- read.csv("data/screening_time.csv", header = T, row.names = NULL)
colnames(screened) <- c("index", tail(colnames(screened), -1))
screened <- data.table(screened)
attach(screened)

shinyServer(function(input, output) {
        
        fit <- reactive({lm(read_time ~ poly(index, input$degree))})
        
        output$fitPlot <- renderPlot({
                plot(read_time, main = 'Read time per abstract, with polynomial fit',
                     xlab = "Number of abstracts screened",
                     ylab = "Screening time per abstract (in seconds)")
                lines(x = index, y = fit()$fitted.values, col = "red", lwd = 3)
        })
        
        output$rmse <- renderText({round(summary(fit())$sigma, 2)})
})
