library(shiny)
library(tidyverse)
library(janitor)

ui<- fluidPage(
  
  tableOutput("tb1")
)


server<- function(input , output , session) {
   data1 <- reactive({
     "10_Property_stolen_and_recovered.csv" %>% 
       read.csv()
     clean_names() -> df1
   })
   data2 <- reactive({
     data1() %>% 
       rename("state_ut" = "area_name")
   })
   output$tb1 <- renderTable({
     data2()
   })
}

shinyApp(ui, server)