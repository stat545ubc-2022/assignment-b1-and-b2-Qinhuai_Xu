#' Mode function
#'
#' This function is used to get the mode(most appearing) number/character in the input list
#'
#' @param x the input list
#'
#' @return the mode(most appearing) number/character of input list
#' @export
#'
#' @examples
#' Mode(c("A", "B", "C", "A", "A")) # should be "A"
#' Mode(c(1, 2, 1, 1, 1)) # should be 1
#'
Mode <- function(x) {
  uniq_value <- unique(x)

  freq <- tabulate(match(x, uniq_value))

  uniq_value[freq == max(freq)]
}
