
test_that("Test SVGs", {
  expect_error(weathersvg("wi-cloudyerr"))

  x <- weathersvg("wi-cloudy", style = list(fill = "red",
                                          width = "10%"))
  expect_true(inherits(x, "html"))
  expect_true(inherits(x, "character"))

  x <- weathersvg("wi-wind-deg.svg", style = list(fill = "blue",
                                                rotate = "45deg",
                                                width = "10%"))
  expect_true(inherits(x, "html"))
  expect_true(inherits(x, "character"))

  x <- weathersvg("wi-train.svg", style = list(fill = "yellow",
                                             width = "10%"))
  expect_true(inherits(x, "html"))
  expect_true(inherits(x, "character"))

  x <- weathersvg("wi-train.svg", style = list(fill = "yellow",
                                               width = "10%"),
                  className = "myclass")
  expect_true(inherits(x, "html"))
  expect_true(inherits(x, "character"))

  x <- weathersvg("wi-train.svg", className = "myclass")
  expect_true(inherits(x, "html"))
  expect_true(inherits(x, "character"))

})
