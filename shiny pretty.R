library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("🎉 Custom Greeting Generator"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("name", "Enter your name:", value = ""),
      radioButtons("greet_type", "Choose Greeting Type:",
                   choices = c("Time-based Greeting", "Random Greeting")),
      actionButton("generate", "Generate Greeting")
    ),
    
    mainPanel(
      h3("Your Greeting:"),
      verbatimTextOutput("greeting_output")
    )
  )
)

# Define Server Logic
server <- function(input, output) {
  
  generate_greeting <- reactive({
    req(input$name)  # Ensure name is entered
    
    name <- input$name
    type <- input$greet_type
    
    if (type == "Time-based Greeting") {
      hour <- as.numeric(format(Sys.time(), "%H"))
      if (hour < 12) {
        greeting <- "Good morning"
      } else if (hour < 17) {
        greeting <- "Good afternoon"
      } else {
        greeting <- "Good evening"
      }
      return(paste(greeting, name, "! Hope you're having a great day."))
      
    } else {
      greetings <- c(
        paste("Hey", name, "! How's it going?"),
        paste("Welcome", name, "! Great to see you."),
        paste("Hello", name, "!"),
        paste("Hi there,", name, "! Enjoy coding in R!"),
        paste("Yo", name, "! Stay awesome.")
      )
      return(sample(greetings, 1))
    }
  })
  
  output$greeting_output <- renderText({
    input$generate  # Trigger reactivity when button is clicked
    isolate(generate_greeting())  # Prevent it from auto-refreshing on every keystroke
  })
}

# Run the app
shinyApp(ui = ui, server = server)
