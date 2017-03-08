#' Make a magrader submission object
#'
#' A magrader submission object contains six parts:
#' 1. `answer` - The student's original answer (stored as a string)
#' 2. `focus` - An optional portion of the student's code parsed as an expression tree
#' 3. `status` - The current status (pass, fail, warn)
#' 4. `warnings` - A set of warnings
#' 5. `praise` - A set of praise messages
#' 6. `failure` - A set of failure messages
#'
#' @param answer - The complete, original student submission as a character string
#' @param focus - A portion of the student answer parsed as an expression tree
#' @param status - The current status of the submission: "pass", "fail", or "warn"
#' @param warnings - Warning messages as a vector of character strings, to be displayed if final status is warn
#' @param praise - Praise messages as a vector of character strings, to be displayed if final status is warn or pass
#' @param failure - Failure messages as a character strings, to be displayed if status switches to fail
#'
#' @return A magrader submission class object, which inherits the list class
#' @export
make_submission <- function(answer,
                            focus = NULL,
                            status = "pass",
                            warnings = NULL,
                            praise = NULL,
                            failure = NULL) {

  if (!status %in% c("pass", "fail", "warn"))
    stop("Submission status must be one of 'pass', 'fail' or 'warn'")

  structure(list(answer = answer,
                 focus = focus,
                 status = status,
                 warnings = warnings,
                 praise = praise,
                 failure = failure),
            class = c("submission", "list"))
}
