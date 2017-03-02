#' Extract message
#'
#' Extracts the message component of a magrader pipe result
#'
#' @param result A result class object created by a magrader function. At the
#'   moment the only result class is "failure".
#'
#' @return A character string that contains the message to display to the
#'   student.
#' @export
extract_message <- function(result) {
  class(result) <- "character"
  result
}
