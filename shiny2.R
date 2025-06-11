library(shiny)

ui<- fluidPage(
  fluidRow(
    column(3, h1("Text 1")),
    column(3, h1("Text 2")),
    column(3, h1("Text 2")),
    column(3, h1("Text 3"))
          )
)
server<- function(input , output , session){
  
}

shinyApp(ui, server)
