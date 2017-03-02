#' Check whether code calls a desired function or object
#'
#' `code_calls()` is designed to be used in a magrittr pipe. It will first check
#' whether the code input has a;lready failed a previous check. If it has not,
#' `code_calls()` will check to see whether the code calls the given object or
#' function.
#'
#' @param code The code to check, as a character string, or the output of a
#'   previous check function. If you are using `code_calls()` within a tutor
#'   document, set code to the special name `.answer`.
#' @param call The name of a function or object to check for as a character
#'   string.
#' @param message A character string of feedback to display if the code fails
#'   the check
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
code_calls <- function(code,
                       call,
                       message = paste("I expected to see a call to", call)) {

  # Don't grade if already wrong
  if(is_failure(code))
    return(code)

  # grade
  is_correct <- stringr::str_detect(code, call)

  if (is_correct)
    return(code)
  else
    fail_with(message)
}
