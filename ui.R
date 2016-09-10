
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("How long does it take to screen abstracts?"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
            wellPanel(p("For a literature review, I needed to screen many (>1000) abstracts.
                       To do this as quickly and lean as possible, I built a
                        shiny app for that (this is not the app). 
                        I was curious how long it was going to take me to screen 
                        all the abstracts, so I 
                        recorded the screening time per abstract as I went along. It was
                         probable that the screening time would go down after 
                        having screened more abstracts. To visualize this 
                        relationship, I've plotted the screening time vs the 
                        index of the abstract, and fitted a polynomial."), br(),
                      p("If you know how long it takes to screen an abstract, 
                        and count in the fact that this time goes down as you screen more 
                        abstracts, you can better assess how much time screening 
                        the rest of the abstracts is going to take you."), br(),
                      p("Because this is real-world data, finding the 'perfect' 
                        fit is not a trivial task. 
                        As a user, you get to decide what you think the best polynomial 
                        degree for this data is. To measure the goodness-
                        of fit, the root-mean-squared error (RMSE) is 
                        displayed too")),
      sliderInput("degree",
                  "Polynomial degree for fit",
                  min = 1,
                  max = 7,
                  value = 1)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("fitPlot"),
      wellPanel(
              p("Goodness of fit (RMSE):"),
              textOutput("rmse")
      )
      
    )
  )
))
