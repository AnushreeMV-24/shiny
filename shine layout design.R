library(shiny)

ui<- fluidPage(
  fluidRow(
    column(6, h1("shiny is an R package that makes it easy to build interactive web applicatios(apps) ")),
    column(6, h1("shiny is an R package that makes it easy to build interactive web applicatios(apps)")),
    column(6, h1("shiny is an R package that makes it easy to build interactive web applicatios(apps)")),
    column(6, h1("shiny is an R package that makes it easy to build interactive web applicatios(apps)"))
  )
    
)
server<- function(input , output , session){
  
}

shinyApp(ui, server)