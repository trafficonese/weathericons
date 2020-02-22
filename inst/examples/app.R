library(shiny)
library(weathericons)

## Icon List #########################
iconList <- invisible(lapply(iconlist, function(x) {
  x = tagAppendAttributes(weathericon(x), title = x)
}))

## UI #########################
ui <- fluidPage(
  tags$head(tags$style(".wi {cursor: pointer;}")),
  tags$head(tags$script('
  $(document).on("shiny:connected", function(event) {
    $(document).on("click", ".wi", function(x) {
     var title = x.target.attributes.title.nodeValue;
     Shiny.setInputValue("icontitle", title);
    })
  })')),
  h4("Click on an icon to get the name"),
  iconList,
  hr(),
  verbatimTextOutput("title")
)

## Server #########################
server <- function(input, output, session) {
  output$title <- renderText({
    req(input$icontitle)
    paste("Icon Name:", input$icontitle)
  })
}

shinyApp(ui, server)
