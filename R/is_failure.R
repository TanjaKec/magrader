#' Does an object inherit the failure class?
#'
#' `is_failure` can be used to check whether an answer has already been marked
#' as a failure by an upstream check in a check pipe.
#'
#' @param ans A character string of student code provided by tutor or reults
#'   class object created by a magrader function.
#'
#' @return `TRUE` or `FALSE`
#' @export
is_failure <- function(ans) {
  is_submission(ans) && ans$status == "fail"
}
