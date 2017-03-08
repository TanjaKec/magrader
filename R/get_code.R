#' Extracts code from a magrader submission object
#'
#' @param submission A character string or magrader submission object.
#'
#' @return A character string of student code supplied by the tutor package
get_code <- function(submission) {
  if (!is_submission(submission)) return(submission)
  if(is.null(submission$focus)) return(submission$answer)
  submission$focus
}
