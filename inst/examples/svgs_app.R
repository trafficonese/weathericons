library(shiny)
library(weathericons)

svgList <- lapply(svglist, weathersvg, style = list(width = "3%",
                                                    stroke = "darkblue",
                                                    fill = "blue",
                                                    "fill-opacity" = 0.7,
                                                    "stroke-width" = 1),
                  className = "myclass")

ui <- fluidPage(
  tags$head(tags$script('
  $(document).on("shiny:connected", function(event) {
    $(document).on("click", "svg", function(x) {
      var title = x.target.ownerSVGElement.attributes.name.nodeValue;
      Shiny.setInputValue("icontitle", title);
    })
  })')),
  tags$head(tags$style("
    .myclass path {
      fill: yellow;
      transition: all 0.5s ease-out;
    }
    .myclass path:hover, .myclass path:focus {
      stroke-width: 3;
      stroke: red;
      fill: orange;
  }")),
  h4("Click on an SVG to get the name"),
  svgList,
  hr(),
  verbatimTextOutput("title")
)

server <- function(input, output, session) {
  output$title <- renderText({
    req(input$icontitle)
    paste("SVG Name:", input$icontitle)
  })
}
shinyApp(ui, server)
