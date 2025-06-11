library(shiny)
library(tidyverse)
library(janitor)

ui <- fluidPage(
  fluidRow(textOutput("totall_cases")),
  fluidRow()
  tableOutput("year_wise_table")
)
server <- function(input , output , session) {
  
data1 <- reactive({
  "10_Property_stolen_and_recovered.csv"
  read.csv() %>% 
    clean_names()
}) 
data2 <- reactive({
  data1
})