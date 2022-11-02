# DataCamp Shinya app

library(shiny)
library(babynames)




# App 1 -------------------------------------------------------------------


ui <- fluidPage(
  textInput("name", "Enter a name:"),
  textOutput("q"))

server <- function(input,output){
  output$q <- renderText({
    paste("Do you prefer", input$name, "?")
  })
  
}

shinyApp(ui = ui, server = server)




# App 2 -------------------------------------------------------------------


ui <- fluidPage(
  textInput("name", "What is your name?"),
  # CODE BELOW: Display the text output, greeting
  # Make sure to add a comma after textInput()
  textOutput("greeting")
  
)

server <- function(input, output) {
  # CODE BELOW: Render a text output, greeting
  
  output$greeting <- renderText({
    paste("Hello", input$name)
  })
  
}

shinyApp(ui = ui, server = server)



# App 3 -------------------------------------------------------------------


ui <- fluidPage(
  titlePanel("Babe Name Explorer"),
  
  sidebarLayout(
    
  sidebarPanel(
    
    textInput('name', 'Enter Name', 'Ali')),
  
  mainPanel(
    plotOutput('trend')
    )
  )
)


server <- function(input, output, session){
  
  output$trend <- renderPlot({
    data_name <- subset(
      babynames, name == input$name
    )
    ggplot(data_name)+
      geom_line(aes(x = year, y = prop, color = sex))
  })
}


shinyApp(ui = ui, server = server)


# App 3 -------------------------------------------------------------------


selectInput('InputId', 'label', choices = c('a','b','c'))
sliderInput('InputId', 'label', value = 1925, min = 1980, max = 2000)



ui <- fluidPage(
  textInput('name', 'something'),
  selectInput('name2', 'something', choices = c('a', 'b', 'c')),
  textOutput('blah'),
  
  
)

server <- function(input, output, session){
  output$greeting <- renderText({
    paste('bla', input$name)
  })
}
































