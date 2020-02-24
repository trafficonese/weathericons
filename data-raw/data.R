## code to prepare `DATASET` dataset goes here

library(XML)
url = "https://raw.githubusercontent.com/erikflowers/weather-icons/master/values/weathericons.xml"
download.file(url, destfile = "iconlist.xml")
iconlist <- xmlTreeParse("iconlist.xml")
iconlist <- xmlSApply(iconlist$doc$children$resources, xmlAttrs)
iconlist <- as.character(iconlist)
unlink("iconlist.xml")
iconlist <- gsub("_", "-", iconlist, fixed = TRUE)
usethis::use_data(iconlist, overwrite = TRUE)

svglist <- system.file("www/styles/svg", package = "weathericons")
svglist <- list.files(svglist)
usethis::use_data(svglist, overwrite = TRUE)

quadrants <- c("n","nne","ne","ene",
               "e","ese","se", "sse",
               "s","ssw","sw","wsw",
               "w","wnw","nw","nnw")
usethis::use_data(quadrants, overwrite = TRUE)

