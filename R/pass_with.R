#' Mark a submission as a pass
#'
#' Returns a magrader submission object that can be piped to downstream checks
#' for additional checking.
#'
#' @param submission Student code provided as a character string by tutor, or a
#'   submission object created by magrader
#' @param message A character string to display to the student
#'
#' @return An S3 submission object
pass_with <- function(submission, message = NULL) {

  if(is_submission(submission)) {
    submission$feedback <- c(submission$feedback, message)
    submission
  } else {
    structure(list(code = submission,
                   status = "pass",
                   feedback = message),
              class = "submission")
  }
}
