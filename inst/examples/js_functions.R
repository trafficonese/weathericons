library(shiny)
library(htmlwidgets)
library(weathericons)

## UI #########################
ui <- fluidPage(
  h4("Using JS functions and inline styles"),
  ## Scripts and Styles #######################
  tags$head(tags$script('function my_ondblclick(x) {document.getElementById(x).style.background = "pink";}')),
  tags$head(tags$script('function my_onmouseover(x) {document.getElementById(x).style.color = "blue";}')),
  tags$head(tags$script('function my_onmouseout(x) {document.getElementById(x).style.color = "yellow";}')),
  tags$head(tags$script('function dragStart(event) {event.dataTransfer.setData("Text", event.target.id);}
        function dragging(event) {document.getElementById("demo").innerHTML = "The p element is being dragged";}
        function allowDrop(event) {event.preventDefault();}
        function drop(event) {
          event.preventDefault();
          var data = event.dataTransfer.getData("Text");
          event.target.appendChild(document.getElementById(data));
          document.getElementById("demo").innerHTML = "The p element was dropped";}'
  )),
  tags$head(tags$style(".droptarget {
    float: left; width: '100%'; height: 100%; margin: 15px; padding: 10px; border: 1px solid #aaaaaa;
  }")),
  ## Draggable / Clickable Icons #######################
  tags$div(class = "droptarget", ondrop = JS("drop(event)"), ondragover = JS("allowDrop(event)"),
    weathericon("wi-forecast-io-fog",
                id = "dragtarget",
                style = list(`background-color` = "red",
                           color = "darkblue",
                           `font-size` = "40px"),
                draggable = "true",
                onclick = JS('console.log(this.id);'),
                ondblclick = JS('my_ondblclick(this.id);'),
                onmouseover = JS('my_onmouseover(this.id)'),
                onmouseout = JS('my_onmouseout(this.id)'),
                ondragstart = JS("dragStart(event)"),
                ondrag = JS("dragging(event)")
                )
  ),
  tags$div(class = "droptarget", ondrop = JS("drop(event)"), ondragover = JS("allowDrop(event)"),
           tags$p("Drop me in here")),
  tags$p(style = "clear:both;", id = "demo")
)

## Server #########################
server <- function(input, output, session) {}
shinyApp(ui, server)
