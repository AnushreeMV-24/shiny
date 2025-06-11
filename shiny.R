
library(shiny)
ui<- fluidPage(
  h1("Hello World"),
  h2("Hello World"),
  h3("Hello World"),
  h4("Hello World"),
  p("This is a paragraph,
    shiny is an R package that makes it easy to build interactive web applicatios(apps)")
  
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
