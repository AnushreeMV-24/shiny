library(shiny)

ui<- fluidPage(
  fluidRow(
    column(6, h1("heyyaaaaaaa ")),
    column(4, h1("halaluyaaa")),
    column(5, h1("mogamboo")),
    column(4, h1("kush huaa")),
    column(3, h1("heyyaaaaaaa ")),
    column(2, h1("halaluyaaa")),
    column(4, h1("mogamboo")),
    column(1, h1("kush huaa"))
  )
)
server<- function(input , output , session){
  
}

shinyApp(ui, server)