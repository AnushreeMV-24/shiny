library(tidyverse)
library(janitor)
library(shiny)

ui<- fluidPage(
  tableOutput("yr_tr") 
)
server <- function(input , output, session){
  
   data1 <- reactive({
     aqidf <- read.csv("INDIA-AQI-DATA-2015-2020.csv") %>% 
       clean_names() -> aqidf
     
     aqidf <- aqidf %>% 
       mutate(
         year=date%>%year(),
              month=date%>%month(),
              month2 = date %>% month(label= TRUE),
              day=date%>%day(),
              week=date%>%week(),
              weekday=date%>%wday(label=TRUE))->aqidf1
     
     aqidf1 %>% 
       pivot_longer(c(5:12), names_to= "pollutants", values_to= "value") -> aqidf2
   })

 output$yr_tr <- renderTable({
   #Year_wise_pollutant_trends
   data1() %>% 
     group_by(year, pollutants) %>% 
     summarise(mean_value= mean(values, na.rm= T)) -> aqi_yearwise
 })
 
}
shinyApp(ui, server)












