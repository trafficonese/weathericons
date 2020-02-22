library(shiny)
library(leaflet)
library(weathericons)

## Add Random Wind Direction
breweries91$winddir <- sample(1:360, nrow(breweries91))
## Create Icons depending on Wind Direction
breweries91$icon <- unlist(lapply(breweries91$winddir, function(x) {
  HTML(as.character(weathericon(name = "wi-wind", from = x)))}))

ui <- fluidPage(
  weathericon(), ## This is needed, otherwise CSS files are not included. Make a useWeathericons() function?
  leafletOutput("map")
)

server <- function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addMarkers(data = breweries91,
                 popup = ~sprintf("Icon: %s<br>Direction: %s",
                                  icon, winddir))
  })
}

shinyApp(ui, server)
