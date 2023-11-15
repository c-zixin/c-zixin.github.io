library(shiny)
library(ggplot2)

# Define UI ----
ui <- fluidPage(
  tags$head(
    tags$style(
      HTML("body { overflow: hidden; }"),
      HTML(".sidebar { text-align: left; }"),
      HTML(".main-panel { overflow-y: scroll; }"),
      HTML(".slider-container { width: 300%; margin: 0 auto; }"),  # Adjust slider width and centering
      HTML(".slider-input { width: 100%; }")  # Adjust slider input width
    )
  ),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("Attractive", "Attractive", min = 1, max = 10, value = 5),
      sliderInput("Ambitious", "Ambitious", min = 1, max = 10, value = 5),
      sliderInput("Fun", "Fun", min = 1, max = 10, value = 5),
      sliderInput("Intelligent", "Intelligent", min = 1, max = 10, value = 5),
      sliderInput("Sincere", "Sincere", min = 1, max = 10, value = 5),
      textOutput("TopRatedAttribute")
    ),
    
    mainPanel(
      div(
        img(src = src/img2.jpeg, height = 500, width = 500),
        style = "float: left; margin-top: 20px;"
      )
    )
  )
)

server <- function(input, output) {
  output$TopRatedAttribute <- renderText({
    # Define a vector of attribute names
    attribute_names <- c("Attractive", "Sincere", "Intelligent", "Fun", "Ambitious")
    
    # Find the attribute with the maximum rating
    max_rating <- max(input$Attractive, input$Sincere, input$Intelligent, input$Fun, input$Ambitious)
    
    top_rated_attribute <- attribute_names[which.max(c(input$Attractive, input$Sincere, input$Intelligent, input$Fun, input$Ambitious))]
    
    paste("The top-rated attribute is:", top_rated_attribute, "with a rating of", max_rating)
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)
