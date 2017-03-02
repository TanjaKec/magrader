
#' Create a failure message
#'
#' Returns a feedback message that can be piped through downstream checks
#' without triggering the checks.
#'
#' @param message A character string to display to the student.
#'
#' @return A character string with the S3 class "failure"
#' @export
#'
#' @examples
#' fail_with("Did you remember to use na.rm = TRUE?")
fail_with <- function(message) {
  structure(message, class = "failure")
}
