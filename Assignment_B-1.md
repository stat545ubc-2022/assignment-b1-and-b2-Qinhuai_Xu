Assignment B-1
================

``` r
library("dplyr")
library("testthat")
```

## Exercise 1: Make a Function

``` r
#' Mode function
#'
#' This function is used to get the mode(most appearing) number/character in the column
#'
#' @param x is the input column
#' 
#' @return the mode number/character will be returned
#' @export
#'
Mode <- function(x) {
  uniq_value <- unique(x)
  
  freq <- tabulate(match(x, uniq_value))

  uniq_value[freq == max(freq)]
}
```

## Exercise 2: Document your Function

**See above**

## Exercise 3: Include examples

**Example 1:**

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

**Example 2:**

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

## Exercise 4: Test the Function

### Test 1:

``` r
test_that("Test 1:", {
  expect_equal(Mode(c(NA, NA, "A", "B", "C", "A", "A")), "A")
})
```

    ## Test passed 😀

### Test 2:

``` r
test_that("Test 2:", {
  expect_equal(is.na(Mode(numeric(0))), TRUE)
})
```

    ## Test passed 😀

### Test 3:

``` r
test_that("Test 3:", {
  expect_error(Mode(iris$Species, mtcars$cyl))
})
```

    ## Test passed 🥇
