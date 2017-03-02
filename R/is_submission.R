#' Is x a submission
#'
#' Tests whether an object inherits the magrader submission class. Submission
#' objects contain student code supplied by the tutor package as a character
#' string, a status, and possible feedback messages.
#'
#' @param x an R object
#'
#' @return `TRUE` or `FALSE`
#' @export
is_submission <- function(x) {
  inherits(x, "submission")
}
