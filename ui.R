
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
                       I was curious how long it was going to take me, so I 
                        recorded the screening time as I went along. It was
                         probable that the screening time would go down after 
                        having screened more abstracts. To visualize this 
                        relationship, I've plotted the screening time vs the 
                        index of the abstract, and fitted a polynomial."), br(),
                      p("As a user, you get to decide what the best polynomial 
                        degree for this fit is")),
      sliderInput("degree",
                  "Polynomial degree for fit",
                  min = 1,
                  max = 4,
                  value = 1)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("fitPlot")
    )
  )
))
