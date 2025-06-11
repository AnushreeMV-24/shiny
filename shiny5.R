library(shiny)
library(tidyverse)

ui<- fluidPage(

  textInput("num1", "A", value = 0),
  numericInput("num2", "B",value = 1),
  numericInput("num3", "C",value = 2),
  textOutput("sumabc")
)
server<- function(input, output , session) {
  output$sumabc<- renderText({
    print(class(input$sum1))
    
    input$num1 %>% as.numeric() -> num1
    num1 + input$num2 + input$num3
  })
}
shinyApp(ui, server)