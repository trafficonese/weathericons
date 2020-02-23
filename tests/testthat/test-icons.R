test_that("multiplication works", {

  x <- weathericon()
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-day-sunny")


  x <- weathericon("wi-wu-chanceflurries")
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-wu-chanceflurries")

  x <- weathericon("wi-moon-waxing-crescent-3")
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-moon-waxing-crescent-3")


  ## Rotating Icons
  x <- weathericon("wi wi-yahoo-7", rotate = "90")
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-rotate-90 wi-yahoo-7")

  x <- weathericon("wi wi-yahoo-7", rotate = "180")
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-rotate-180 wi-yahoo-7")

  x <- weathericon("wi wi-yahoo-7", rotate = "270")
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-rotate-270 wi-yahoo-7")

  ## Flipping Icons
  x <- weathericon("wi wi-yahoo-7", flip = "vertical")
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-yahoo-7 wi-flip-vertical")

  x <- weathericon("wi wi-yahoo-7", flip = "horizontal")
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-yahoo-7 wi-flip-horizontal")

  ## Wind Icons with Directions
  x <- weathericon("wi wi-wind", towards = "sse")
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-wind wi-towards-sse")

  x <- weathericon("wi-wind", from = "sw")
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-wind wi-from-sw")

  x <- weathericon("wi wi-wind", towards = 40)
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-wind towards-40-deg")

  x <- weathericon("wi wi-wind", from = 40)
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-wind from-40-deg")

  ## Add className
  x <- weathericon("wi-moon-alt-waxing-crescent-3", className = "myclass")
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-moon-alt-waxing-crescent-3 myclass")

  ## Add inline styling
  x <- weathericon("wi-moon-alt-waxing-crescent-3",
                   style = list(`background-color` = "red",
                                color = "darkblue",
                                `font-size` = "40px"))
  expect_true(x$name == "i")
  expect_true(x$attribs$class == "wi wi-moon-alt-waxing-crescent-3")
  expect_true(x$attribs$style == "background-color:red;color:darkblue;font-size:40px")

})
