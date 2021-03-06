% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/icons.R
\name{weathersvg}
\alias{weathersvg}
\title{weathersvg}
\usage{
weathersvg(name, style = NULL, className = NULL)
}
\arguments{
\item{name}{Name of the SVG}

\item{style}{A named list to style the SVG. See the examples}

\item{className}{Define a classname for the SVG}
}
\value{
A weather-svg element
}
\description{
Create a weathersvg
}
\examples{
\dontrun{

## To see all SVGs, run this shiny-app
shiny::runApp(system.file("examples/svgs_app.R", package = "weathericons"),
              display.mode = "showcase")

weathersvg("wi-cloudy", style = list(fill = "red",
                                     width = "10\%"))

weathersvg("wi-wind-deg.svg", style = list(fill = "blue",
                                           rotate = "45deg",
                                           width = "10\%"))

weathersvg("wi-train.svg", style = list(fill = "yellow",
                                        width = "10\%"))
}
}
\seealso{
\href{https://erikflowers.github.io/weather-icons/}{Weather Icons}
}
