# Test include html

library(shiny)

ui <- navbarPage("Test Include HTML",
          navbarMenu("Menu",
                     tabPanel("Sub-menu 1",
                              h3("This is sub-menu 1")
                              ),
                     tabPanel("Sub-Menu 2",
                              h3("This is sub-menu 2")
                              )),
          tabPanel("Menu2",
                   h3("This is menu 2")
                   ),
          tabPanel("Doc",
                  includeHTML("doc.html")
                   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
}

# Run the application 
shinyApp(ui = ui, server = server)
