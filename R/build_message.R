#' Builds message to display for student
#'
#' @param submission A magrader submission object
#'
#' @return A character string suitable for using in the tutor exercise checker
#'   function message field.
#'
#' @export
build_message <- function(submission) {
  switch(submission$status,
        "pass" = paste("Good Job!",
                       paste(submission$praise, collapse = " ")),
        "warn" = paste("Well done.",
                       paste(submission$praise, collapse = " "),
                       "But be careful:",
                       paste(submission$warnings, collapse = " ")),
        "fail" = paste("Sorry!",
                       submission$failure,
                       "Also look out for these things:",
                       paste(submission$warnings, collapse = " ")))
}
