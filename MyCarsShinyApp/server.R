#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$mpgPlot <- renderPlot({
    
    # Transmition Auto/Manual
    ams <- 99
    if(input$am_a) {ams <- c(ams, 0)}
    if(input$am_m) {ams <- c(ams, 1)}

    # Number of cylinders
    cyls <- 99
    if(input$cyl_4) {cyls <- c(cyls, 4)}
    if(input$cyl_6) {cyls <- c(cyls, 6)}
    if(input$cyl_8) {cyls <- c(cyls, 8)}

    # Horse power
    hps  <- input$hp

    pData <- subset(mtcars, (am %in% ams) & (cyl %in% cyls) & ((hp >= hps[1]) & (hp <= hps[2])))
    pData$am <- factor(pData$am)
    print(head(pData))

    # Plot
    p <- qplot(hp, mpg, data = pData, color = am,
               facets = am~cyl,
               main = "Scatterplots of MPG vs. Horsepower",
               xlab = "Horsepower", 
               ylab = "Miles per Gallon")
    p <- p + geom_point(size = 3)
    p <- p + theme(axis.title = element_text(face = "bold.italic", size = "12", color = "brown"), 
                   legend.position = "top")
    p
  })
  
})
