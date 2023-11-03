library(shiny)
library(ggplot2)

data <- data.frame(
  Feature = c("Kind Eyes", "Sweet Voice", "Perfect Hair"),
  Score = c(5, 4, 3)
) 

# Define UI ----
ui <- fluidPage(titlePanel ("What makes an ideal partner?"),
sidebarLayout(
                  position = "left",
                  sidebarPanel("sidebar panel"),
                  mainPanel(h1("Introduction"),
                            h6("Have you ever thought of what makes your ideal partner?
                               Does he or she have the kindest eyes, 
                               the sweetest voice or perhaps the most perfect hair?"), 
                  plotOutput("featurePlot"))
                
))
server <- function(input, output) {
  # Create a ggplot2 plot
  output$featurePlot <- renderPlot({
    ggplot(data, aes(x = Feature, y = Score)) +
      geom_bar(stat = "identity") +
      labs(x = "Feature", y = "Score") +
      theme_minimal()
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)