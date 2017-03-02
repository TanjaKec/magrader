#' Check whether code calls a desired function or object
#'
#' `code_calls()` is designed to be used in a magrittr pipe. It will first check
#' whether the code input has a;lready failed a previous check. If it has not,
#' `code_calls()` will check to see whether the code calls the given object or
#' function.
#'
#' @param submission The code to check, as a character string, or the output of a
#'   previous check function. If you are using `code_calls()` within a tutor
#'   document, set code to the special name `.answer`.
#' @param call The name of a function or object to check for as a character
#'   string.
#' @param message A character string of feedback to display if the code fails
#'   the check
#' @param warn `TRUE` or `FALSE`: should grading continue if condition is unmet?
#'   If `TRUE`, `code_calls()` will mark the submission as a warning and pass
#'   the submission to the next check in the checking pipe. In this case,
#'   `code_calls()` will append the message to the list of messages to be
#'   displayed when checking completes.
#' @param praise A character string of feedback to display if the code passes
#'   the check. If a submission receives more than one praise. When checking
#'   finishes, magrader will display all of the warnings and praises that have
#'   accumulated for a submission.
#'
#' @return If the code passes the check, `code_calls()` returns the original
#'   code. If the code fails the check, `code_calls()` returns a failure object
#'   that contains a feedback message.
#' @export
#'
#' @examples
#' \dontrun{
#' "head(mtcars)" %>%
#'   code_calls("head") %>%
#'   code_calls("mpg", "oops, wrong data set.")
#'
#' # If in a tutor document
#' .answer %>%
#'   code_calls("head") %>%
#'   code_calls("mpg", "oops, wrong data set.")
#' }
code_calls <- function(submission,
                       call,
                       message = paste("I expected to see a call to", call),
                       warn = FALSE,
                       praise = NULL) {

  # Don't grade if already marked as a failure
  if(is_failure(submission))
    return(submission)

  code <- get_code(submission)
  is_correct <- stringr::str_detect(code, call)

  if (is_correct)
    submission %>% pass_with(praise)
  else if (warn)
    submission %>% warn_with(message)
  else
    submission %>% fail_with(message)
}
