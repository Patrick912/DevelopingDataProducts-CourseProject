#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Predictor"),

    # Sidebar with input for last eruption time
    sidebarLayout(
        sidebarPanel(
            numericInput("eruption_length",
                        "Lenght of last eruption:",
                        min = 0.4,
                        max = 7,
                        step = 0.2,
                        value = 3)
        ),

        # Show a plot of faithful data plus the predicted waiting time based
        # on user input
        mainPanel(
            h4('Predicted waiting time for next eruption in minutes:'),
            textOutput("wait_time"),
            plotOutput("distPlot")
        )
    )
))
