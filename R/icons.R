#' weathericon
#' @description Create a weathericon for use within a page. Icons can appear on
#' their own, inside of a button, or as an icon for a tabPanel() within a navbarPage().
#' @importFrom htmltools HTML tags singleton htmlDependencies htmlDependency
#'   browsable htmlDependencies<-
#' @importFrom utils globalVariables adist
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
#' @param ... Additional arguments that are passed to the attributes
#'   of the i-tag. Style arguments must be passed as a named list.
#' @details
#' The arguments \code{towards} and \code{from} can either be an integer value
#' between 0-360 or a character giving the direction. The possible items are
#' stored in the dataset \code{quadrants}.
#' @return A weather-icon element
#' @export
#' @seealso \href{https://erikflowers.github.io/weather-icons/}{Weather Icons}
#' @examples
#' if (interactive()) {
#'
#' weathericon("wi-forecast-io-fog")
#' weathericon("wi-wu-chanceflurries")
#' weathericon("wi-moon-waxing-crescent-3")
#' weathericon("wi-forecast-io-rain")
#' weathericon("storm-warning")
#' weathericon("day-fog")
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
weathericon <- function(name = NULL, wind = TRUE,
                        flip = NULL, rotate = NULL,
                        towards = NULL, from = NULL,
                        className = NULL,
                        ...) {

  ## If name is NULL, show some Sun ###############
  if (is.null(name)) name = "wi wi-day-sunny"

  ## Add "wi " class if not there ###############
  if (!grepl("wi-",name, fixed = TRUE)) name <- paste0("wi-", name)
  if (substr(name, 1, 3) != "wi ") name <- paste0("wi ", name)

  ## Icon Flipping #################
  if (!is.null(flip)) {
    flip <- match.arg(flip, c("horizontal", "vertical"))
    if (flip == "horizontal") name <- paste0(name, " wi-flip-horizontal")
    if (flip == "vertical") name <- paste0(name, " wi-flip-vertical")
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
  styleattr <- list(...)
  if ("style" %in% names(styleattr)) {
    styleattr$style <- paste0(names(styleattr$style), ":",
                              styleattr$style, collapse = ";")
  }
  iconTag <- tags$i(class = name)
  iconTag$attribs <- c(iconTag$attribs, styleattr)

  ## Add Deps ####################
  htmlDependencies(iconTag) <- useWeatherIcons(wind)

  ## Output browsable icon ####################
  htmltools::browsable(iconTag)
}

#' weathersvg
#' @description Create a weathersvg
#' @param name Name of the SVG
#' @param style A named list to style the SVG. See the examples
#' @param className Define a classname for the SVG
#' @return A weather-svg element
#' @export
#' @seealso \href{https://erikflowers.github.io/weather-icons/}{Weather Icons}
#' @examples \dontrun{
#'
#' ## To see all SVGs, run this shiny-app
#' shiny::runApp(system.file("examples/svgs_app.R", package = "weathericons"),
#'               display.mode = "showcase")
#'
#' weathersvg("wi-cloudy", style = list(fill = "red",
#'                                      width = "10%"))
#'
#' weathersvg("wi-wind-deg.svg", style = list(fill = "blue",
#'                                            rotate = "45deg",
#'                                            width = "10%"))
#'
#' weathersvg("wi-train.svg", style = list(fill = "yellow",
#'                                         width = "10%"))
#' }
weathersvg <- function(name, style = NULL, className = NULL) {
  ## Check Name ##################
  fileext <- gsub(".*\\.", "", name)
  if (fileext != "svg") name <- paste0(name, ".svg")
  if (!name %in% svglist) {
    stop("This svg does not exist. Did you maybe mean `",
         svglist[which.min(adist(name, svglist))], "`")
  }
  src <- system.file("www/styles/svg", package = "weathericons")
  svgoutput <- readLines(paste0(src, "/", name))
  ## Remove SVG ID / Add Name ###############
  svgoutput[3] <- gsub('id=\"Layer_1\" ', paste0("name='",name,"' "),
                       fixed = TRUE, svgoutput[3])
  ## Change SVG style #################
  if (!is.null(style)) {
    style <- paste(paste0(names(style), ":", style), collapse = ";")
    svgoutput[4] <- gsub('style=\"enable-background:new 0 0 30 30;\" ',
                         paste0("style =\"" ,style, "\""),
                         fixed = TRUE, svgoutput[4])
  }
  ## Add className if given ################
  if (!is.null(className)) {
    svgoutput[3] <- gsub('version=\"1.1\" ', paste0("version=\"1.1\" class='", className, "' "),
                         fixed = TRUE, svgoutput[3])
  }
  ## Output as SVG ###################
  browsable(HTML(paste(svgoutput, collapse = "")))
}

#' useWeatherIcons
#' @description Import the CSS files, if you're not using \code{\link{weathericon}}
#'   anywhere else in the UI.
#' @param wind Should the Wind-Stylesheet be included as dependency.
#'   The default is \code{TRUE}
#' @export
useWeatherIcons <- function(wind = TRUE) {
  styles <- c("css/weather-icons.min.css")
  if (wind) styles <- c(styles, "css/weather-icons-wind.min.css")
  htmlDependency(name = "weathericons",
                 version = "1.0.0",
                 src = system.file("www/styles", package = "weathericons"),
                 stylesheet = styles)
}

utils::globalVariables(c("quadrants", "svglist"))
