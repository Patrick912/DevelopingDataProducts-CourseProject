#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(ggplot2)

model <- train(waiting ~., data = faithful, method='lm')
model

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$wait_time <- renderText({
        predict(model, data.frame(eruptions = c(input$eruption_length)))
    })
    
    output$distPlot <- renderPlot({
        y_val <- predict(model, data.frame(eruptions = c(input$eruption_length)))
        # generate bins based on input$bins from ui.R
        g <- ggplot(data=faithful, aes(eruptions, waiting)) + 
            geom_point() + 
            geom_point(aes(x=input$eruption_length, y=y_val), colour="red", fill="red", shape = 23, size = 4)
        g
    })

})
