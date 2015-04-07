
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

source('helpers.R')
library(maps)
library(mapproj)


counties <- readRDS("data/counties.rds")
# percent_map(counties$white, "darkgreen", "% white")

shinyServer(function(input, output){
  output$plot1 <- renderPlot({
    data = switch(input$var,
           'Percent White' = counties$white,
           'Percent Black' = counties$black,
           'Percent Asian' = counties$asian,
           'Percent Hispanic' = counties$hispanic
           )
    color = switch(input$var,
            'Percent White' = 'darkgreen',
            'Percent Black' = 'black',
            'Percent Asian' = 'darkgoldenrod3',
            'Percent Hispanic' = 'darkred')
    legend <- switch(input$var, 
                     "Percent White" = "% White",
                     "Percent Black" = "% Black",
                     "Percent Hispanic" = "% Hispanic",
                     "Percent Asian" = "% Asian")
    percent_map(data, color, legend)
#     percent_map(counties$white, color, "% white")
  })
})