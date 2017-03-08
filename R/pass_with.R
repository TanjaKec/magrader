#' Mark a submission as a pass
#'
#' Returns a magrader submission object that can be piped to downstream checks
#' for additional checking.
#'
#' @param submission Student code provided as a character string by tutor, or a
#'   submission object created by magrader
#' @param praise A character string to display to the student
#'
#' @return An S3 submission object
pass_with <- function(submission, praise = NULL) {

  if(is_submission(submission)) {
    submission$praise <- c(submission$praise, praise)
    submission
  } else {
    make_submission(answer = submission, status = "pass", praise = praise)
  }
}
