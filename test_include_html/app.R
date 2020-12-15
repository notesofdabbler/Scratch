# Test include html

# solved in the following posts
#  https://stackoverflow.com/questions/64385529/including-a-html-file-rendered-from-rmarkdown-in-r-shiny-apps-using-shinydashboa
# https://community.rstudio.com/t/including-a-html-file-rendered-from-rmarkdown-in-r-shiny-apps-using-shinydashboard-is-causing-tabitems-to-break/84819


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
                   htmltools::tags$iframe(src = "doc.html", width = '100%',  height = 1000,  style = "border:none;")
                   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
}

# Run the application 
shinyApp(ui = ui, server = server)
