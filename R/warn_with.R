#' Mark a submission as a pass with a warning
#'
#' Returns a magrader submission object that can be piped to downstream checks
#' for additional checking. If the submission does not fail any downstream
#' checks, it will be marked as a pass, but displayed with a warning message.
#'
#' @param submission Student code provided as a character string by tutor, or a
#'   submission object created by magrader
#' @param message A character string to display to the student
#'
#' @return An S3 submission object
warn_with <- function(submission, message = NULL) {

  if (is.null(message)) stop("Please provide a warning message for the student.")

  if(is_submission(submission)) {
    submission$status <- "warn"
    submission$feedback <- c(submission$feedback, message)
    submission
  } else {
    structure(list(code = submission,
                   status = "warn",
                   feedback = message),
              class = "submission")
  }
}
