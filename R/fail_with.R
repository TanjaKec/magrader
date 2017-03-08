#' Mark a submission as a failure
#'
#' Returns a magrader submission object that can be piped through downstream checks
#' without triggering the checks.
#'
#' @param submission Student code provided as a character string by tutor, or a
#'   submission object created by magrader
#' @param message A character string to display to the student
#'
#' @return A magrader submission object with the status "fail"
fail_with <- function(submission, message = NULL) {

  if (is.null(message)) stop("Please provide a failure message for the student.")

  if(is_submission(submission)) {
    submission$status <- "fail"
    submission$failure <- message
    submission
  } else {
    make_submission(answer = submission, status = "fail", failure = message)
  }
}
