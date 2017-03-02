#' Builds message to display for student
#'
#' @param submission A magrader submission object
#'
#' @return A character string suitable for using in the tutor exercise checker
#'   function message field.
#'
#' @export
build_message <- function(submission) {

  message <- switch(submission$status,
                    "pass" = "Good Job!",
                    "warn" = "Well done, but be careful:",
                    "fail" = "Sorry!")

  if (!is.null(submission$feedback)) {
    if (length(submission$feedback) > 1) {
      add_ons <- paste(submission$feedback, collapse = " ")
      message <- paste(message, add_ons, sep = " ")
    } else {
      message <- paste(message, submission$feedback)
    }
  }
  message
}
