library(shiny)
library(weathericons)

## UI #########################
ui <- fluidPage(
  tags$head(tags$style("
      @keyframes example {
        from {background-color: red;}
        to {background-color: yellow;}
      }
      .class1 {background-color: blue;
               font-size: 30px;
               transition: font-size 2s;}
      .class1:hover {font-size: 40px;}

      .class2 {background-color: gray;
               color: blue;
               box-shadow: 3px 3px 1px grey;
               animation-name: example;
               animation-duration: 8s;}
      .class2:hover {color: red;}

      .class3 {background-image: linear-gradient(blue, red);
               color: yellow;}
      .class3:hover {transform: rotateZ(40deg);}

      .class4 {background-image: linear-gradient(red, yellow, green);
               transform: rotateZ(40deg);}
  ")),
  h4("Using classes to style Icons"),
  weathericon("wi-wmo4680-5", className = "class1"),
  weathericon("wi-wu-chancesnow", className = "class2"),
  weathericon("wi-moon-19", className = "class3"),
  weathericon("wi-earthquake", className = "class4")
)

## Server #########################
server <- function(input, output, session) {}
shinyApp(ui, server)
