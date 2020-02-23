# weathericons


<!-- badges: start -->
[![](https://www.r-pkg.org/badges/version/weathericons)](https://www.r-pkg.org/pkg/weathericons)
[![cran checks](https://cranchecks.info/badges/worst/weathericons)](https://cran.r-project.org/web/checks/check_results_weathericons.html)
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/weathericons?color=brightgreen)](https://www.r-pkg.org/pkg/weathericons)
[![CRAN Downloads](http://cranlogs.r-pkg.org/badges/grand-total/weathericons)](https://www.rpackages.io/package/weathericons)
[![Build Status](https://travis-ci.org/trafficonese/weathericons.svg?branch=master)](https://travis-ci.org/trafficonese/weathericons)
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![codecov](https://codecov.io/gh/trafficonese/weathericons/branch/master/graph/badge.svg)](https://codecov.io/gh/trafficonese/weathericons)
<!-- badges: end -->

The package adds support for the [weather-icons](https://erikflowers.github.io/weather-icons/) library.

<p align="center">
  <img src="inst/img/icons.PNG" width="80%"/>
</p>

## Installation

#### NOT YET!!
~~You can install the released version of weathericons from [CRAN](https://CRAN.R-project.org) with:~~

``` r
install.packages("weathericons")
```

or the development version with:

``` r
remotes::install_github("trafficonese/weathericons")
```


## Example

Basic examples to create weathericons:

``` r
library(weathericons)
weathericon("wi-humidity")
weathericon("wi-forecast-io-rain")
weathericon("wi wi-yahoo-7", rotate = "90")
weathericon("wi wi-yahoo-7", flip = "vertical")
weathericon("wi wi-wind", towards = "sse")
weathericon("wi-wind", from = "sse")
weathericon("wi wi-wind", towards = 40)
weathericon("wi wi-wind", from = 40)
```

List all icons:

``` r
shiny::runApp(system.file("examples/app.R", package = "weathericons"), 
              display.mode = "showcase")
```

Customize icons example with CSS:

``` r
shiny::runApp(system.file("examples/app_classes.R", package = "weathericons"), 
              display.mode = "showcase")
```

Use JS functions and inline styling, please run this shiny-app
``` r
shiny::runApp(system.file("examples/js_functions.R", package = "weathericons"),
              display.mode="showcase")
```

Leaflet popups and labels with weathericons:

``` r
shiny::runApp(system.file("examples/leaflet_popup.R", package = "weathericons"), 
              display.mode = "showcase")
```


