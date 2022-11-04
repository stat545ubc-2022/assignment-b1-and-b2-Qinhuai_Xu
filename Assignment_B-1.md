Assignment B-1
================

``` r
library("dplyr")
library("testthat")
```

## Exercise 1: Implement the function

``` r
#' Mode function
#'
#' This function is used to get the mode(most appearing) number/character in the column
#'
#' @param x the input list
#' 
#' @return the mode(most appearing) number/character of input list 
#' @export
#'
Mode <- function(x) {
  uniq_value <- unique(x)
  
  freq <- tabulate(match(x, uniq_value))

  uniq_value[freq == max(freq)]
}
```

## Exercise 2: Document the function

**See above**

## Exercise 3: Include examples

### Example 1

``` r
iris %>%
  group_by(Species) %>%
  count() %>%
  arrange(desc(n))
```

    ## # A tibble: 3 × 2
    ## # Groups:   Species [3]
    ##   Species        n
    ##   <fct>      <int>
    ## 1 setosa        50
    ## 2 versicolor    50
    ## 3 virginica     50

There are 50 samples for each species, the `Mode` function should return
**all** of these species.

``` r
Mode(iris$Species)
```

    ## [1] setosa     versicolor virginica 
    ## Levels: setosa versicolor virginica

### Example 2

``` r
mtcars %>%
  group_by(cyl) %>%
  count() %>%
  arrange(desc(n))
```

    ## # A tibble: 3 × 2
    ## # Groups:   cyl [3]
    ##     cyl     n
    ##   <dbl> <int>
    ## 1     8    14
    ## 2     4    11
    ## 3     6     7

There are 14 samples with `cyl=8`, the `Mode` function should return
**8**.

``` r
Mode(mtcars$cyl)
```

    ## [1] 8

## Exercise 4: Test the function

### Test 1

Vector with NA’s

``` r
test_that("Test 1:", {
  expect_equal(Mode(c(NA, NA, "A", "B", "C", "A", "A")), "A")
})
```

    ## Test passed 😸

### Test 2

Vector of length 0, like numeric(0)

``` r
test_that("Test 2:", {
  expect_true(is.na(Mode(numeric(0))))
})
```

    ## Test passed 🌈

### Test 3

Redundant inputs

``` r
test_that("Test 3:", {
  expect_error(Mode(iris$Species, mtcars$cyl))
})
```

    ## Test passed 🎊

### Test 4

Vector with no NA’s and numeric

``` r
test_that("Test 4:", {
  expect_equal(Mode(c(1, 2, 1, 1, 1)), 1)
})
```

    ## Test passed 🎊

### Test 5

Vector with no NA’s and character

``` r
test_that("Test 5:", {
  expect_equal(Mode(c("A", "B", "C", "A", "A")), "A")
})
```

    ## Test passed 😀
