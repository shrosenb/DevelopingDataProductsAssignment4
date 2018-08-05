#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Motor Trend Car Road Tests Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h5(strong("Transmition Type:")),
      checkboxInput("am_a", "Automatic", value = TRUE),
      checkboxInput("am_m", "Manual", value = TRUE),
      br(),
      h5(strong("Cylinder Count:")),
      checkboxInput("cyl_4", "4", value = TRUE),
      checkboxInput("cyl_6", "6", value = TRUE),
      checkboxInput("cyl_8", "8", value = TRUE),
      br(),
      sliderInput("hp", "Engine HP Range:", min = min(mtcars$hp), max = max(mtcars$hp), value = c(min(mtcars$hp), max(mtcars$hp))),
      br()
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("mpgPlot")
    )
  )
))
