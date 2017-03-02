#' magrader interface to tutor
#'
#' An exercise checker function to use with the R Markdown tutor package. This
#' function does nothing but check a chunk. It is designed to be used by tutor;
#' tutor will call the function when necessary and supply all of the inputs. To
#' enable the function with tutor, set the following option in a code chunk,
#' `tutor_options(exercise.checker = checker)`.
#'
#' @param label The label of the code chunk to check
#' @param user_code The code provided by the student in the exercise, as a
#'   character string
#' @param check_code The code supplied by the author in the `-check` or
#'   `-code-check` chunks, as a character string
#' @param envir_result The R environment after executing the chunk.
#' @param evaluate_result The return value from the `evaluate::evaluate`
#'   function.
#' @param ... Unused (include for compatibility with parameters to be added in
#'   the future)
#'
#' @return A list in the format that tutor requires to display student feedback.
#' @export
pipe_checker <- function(label = NULL,
                    user_code = NULL,
                    check_code = NULL,
                    envir_result = NULL,
                    evaluate_result = NULL, ...) {

  # Use NSE to check user_code with check_code
  .answer <- user_code
  result <- eval(parse(text = check_code))

  message <- build_message(result)
  correct <- if(result$status == "fail") FALSE else TRUE
  type <- switch(result$status,
                 "pass" = "success",
                 "warn" = "warning",
                 "fail" = "info") # blue is less discouraging than red

  list(message = message,
       correct = correct,
       type = type,
       location = "prepend")
}
