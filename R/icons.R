#' weathericon
#' @importFrom htmltools HTML tags singleton htmlDependencies htmlDependency
#'   browsable htmlDependencies<-
#' @importFrom utils globalVariables
#' @param name Name of the icon
#' @param wind Should the Wind-Stylesheet be included as dependency.
#'   The default is \code{TRUE}
#' @param flip Flip the icon. Either \code{horizontal} or \code{vertical}
#' @param rotate Rotate the icon. Valid values are \code{0,90,180,270,360}
#' @param towards The `towards`-direction for wind icons can be specified either by
#'   degrees or by an orientation. See the details.
#' @param from The `from`-direction for wind icons can be specified either by
#'   degrees or by an orientation. See the details.
#' @param className Define an additional classname for the icon tag.
#' @details
#' The arguments \code{towards} and \code{from} can either be an integer value
#' between 0-360 or a character giving the direction. The possible items are
#' stored in the dataset \code{quadrants}.
#'
#' @export
#' @examples \dontrun{
#'
#' ## To see a full List of icons please run this shiny-app
#' shiny::runApp(system.file("examples/app.R", package = "weathericons"))
#'
#' ## To see how to use classes with icons see the following shiny-app
#' shiny::runApp(system.file("examples/app_classes.R", package = "weathericons"))
#'
#' weathericon("wi wi-forecast-io-fog")
#' weathericon("wi-forecast-io-fog")
#' weathericon("wi-wu-chanceflurries")
#' weathericon("wi-moon-waxing-crescent-3")
#' weathericon("wi-forecast-io-rain")
#'
#' ## Rotating Icons
#' weathericon("wi wi-yahoo-7", rotate = "90")
#' weathericon("wi wi-yahoo-7", rotate = "180")
#' weathericon("wi wi-yahoo-7", rotate = "270")
#'
#' ## Flipping Icons
#' weathericon("wi wi-yahoo-7", flip = "vertical")
#'
#' ## Wind Icons with Directions
#' weathericon("wi wi-wind", towards = "sse")
#' weathericon("wi-wind", from = "sw")
#' weathericon("wi wi-wind", towards = 40)
#' weathericon("wi wi-wind", from = 40)
#'
#' }
#' @seealso \href{https://erikflowers.github.io/weather-icons/}{Weather Icons}
weathericon <- function(name = NULL, wind = TRUE,
                        flip = NULL, rotate = NULL,
                        towards = NULL,
                        from = NULL,
                        className = NULL) {

  ## If name is NULL, show some Sun ###############
  if (is.null(name)) name = "wi wi-day-sunny"

  ## Add "wi " class if not there ###############
  if (substr(name, 1, 3) != "wi ") name <- paste0("wi ", name)

  ## Icon Flipping #################
  if (!is.null(flip)) {
    flip <- match.arg(flip, c("horizontal", "vertical"))
    if (flip == "horizontal") name <- paste(name, " wi-flip-horizontal")
    if (flip == "vertical") name <- paste(name, " wi-flip-vertical")
  }

  ## Icon Rotating #################
  if (!is.null(rotate)) {
    rotate <- match.arg(rotate, choices = c("0", "90","180","270", "360"))
    name <- gsub('wi ', paste0('wi wi-rotate-',rotate,' '), name)
  }

  ## Icon Wind Direction #################
  if (!is.null(towards)) {
    if (tolower(towards) %in% quadrants) {
      ## wind towards quadrants
      name <- paste0(name, " wi-towards-", tolower(towards))
    } else {
      ## Wind towards every Degree
      name <- paste0(name, " towards-", towards, "-deg")
    }
  }
  if (!is.null(from)) {
    if (tolower(from) %in% quadrants) {
      ## wind from quadrants
      name <- paste0(name, " wi-from-", tolower(from))
    } else {
      ## Wind from every Degree
      name <- paste0(name, " from-", from, "-deg")
    }
  }

  ## Add className if given ##################
  if (!is.null(className)) name <- paste(name, className)

  ## Create Tag with Class ####################
  iconTag <- tags$i(class = name)

  ## Add Deps ####################
  styles <- c("css/weather-icons.min.css")
  if (wind) styles <- c(styles, "css/weather-icons-wind.min.css")
  htmlDependencies(iconTag) <- htmlDependency(name = "weathericons",
                                              version = "1.0.0",
                                              src = system.file("www/styles", package = "weathericons"),
                                              stylesheet = styles)

  ## Output browsable icon ####################
  htmltools::browsable(iconTag)
}

utils::globalVariables(c("quadrants"))
