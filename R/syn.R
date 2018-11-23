#' Syn: Get synonyms for one word
#'
#' @param word character, one word you want to find synonyms for
#' @param n_words integer, the number of words to look for. An integer Default is all words
#'
#' @return synonyms of the word you entered
#'
#' @examples
#' # put some examples here
#' syn("good")
#' syn("evil", 25)
#' syns(c("good", "evil"), 10)
#' @export
syn <- function(word, n_words = -1) {
  # We have to get our words_syn back out of the environment we stored it in
  words_syn <- get('words_syn', envir = getOption('syn_env'))

  # Then we can look up our word.
  # What happens when word doesn't exist?
  if (n_words < 0) {
    words_syn[[word]]
  } else {
    sample(words_syn[[word]], n_words)
  }

}

#' Syns: Get synonyms for many words
#'
#' @param words word, character - many words you want to find synonyms for
#' @param n_words integer, the number of words to look for. An integer Default is all words
#'
#' @return named list of synonyms
#' @examples
#' # put some examples here
#' @export
syns <- function(words, n_words = -1) {

  # We have to get our words_syn back out of the environment we stored it in
  words_syn <- get('words_syn', envir = getOption('syn_env'))

  # Then we can look up our word.
  # What happens when word doesn't exist?
  syns <- words_syn[words]

  if (n_words > 0) {
    syns <- purrr::map(syns, sample, n_words)
  }

  purrr::set_names(syns, words)

}
