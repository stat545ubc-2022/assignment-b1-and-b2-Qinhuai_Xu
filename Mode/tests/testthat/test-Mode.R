test_that("Functionality test for Mode function:", {
  expect_equal(Mode(c(NA, NA, "A", "B", "C", "A", "A")), "A")
  expect_true(is.na(Mode(numeric(0))))
  expect_error(Mode(iris$Species, mtcars$cyl))
  expect_equal(Mode(c(1, 2, 1, 1, 1)), 1)
  expect_equal(Mode(c("A", "B", "C", "A", "A")), "A")
})
