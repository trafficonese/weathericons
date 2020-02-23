library(shiny)
library(leaflet)
library(weathericons)

## Add Random Wind Direction
breweries91$winddir <- sample(1:360, nrow(breweries91))
## Create Icons depending on Wind Direction
breweries91$icon <- unlist(lapply(breweries91$winddir, function(x) {
  as.character(weathericon(name = "wi-wind", from = x))}))

ui <- fluidPage(
  useWeatherIcons(), ## Includes the CSS dependencies or use weathericon() somewhere in the UI
  leafletOutput("map")
)

server <- function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addMarkers(data = breweries91,
                 label = lapply(sprintf("Icon: %s<br>Direction: %s",
                                        breweries91$icon, breweries91$winddir), HTML),
                 popup = ~sprintf("Icon: %s<br>Direction: %s",
                                  icon, winddir))
  })
}

shinyApp(ui, server)
