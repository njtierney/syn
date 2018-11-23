

#' Syn
#'
#' @param word word
#'
#' @return words
#' @export
syn <- function(word) {
  # We have to get our words_syn back out of the environment we stored it in
  words_syn <- get('words_syn', envir = getOption('syn_env'))

  # Then we can look up our word.
  # What happens when word doesn't exist?
  words_syn[[word]]
}
