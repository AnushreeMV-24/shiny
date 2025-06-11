library(shiny)

ui <- fluidPage(
  selectInput("species","select species",choices = c("setosa","versicolor","virginica")),
  plotOutput("speciesplot"),
  tableOutput("speciestable")
)

server <- function(input, output, session) {
  speciesdata <- reactive({
    iris %>% 
      filter(Species== input$species)
    
  })
  
  output$speciesplot <- renderPlot({
    speciesdata() %>% 
      ggplot(aes(x= Sepal.length, y= Sepal.Width))+
      geom_plot()
  })
  output$speciesplot <- renderTable({
    iris %>% 
      filter(Species==input$species %>% )
    })
}
shinyApp(ui, server)