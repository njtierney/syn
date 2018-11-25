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

  indices <- words_idx[[word]]

  if (n_words > 0L && length(indices) > 0L) {
    # Avoid trying to sample more words than we have.
    n_words <- min(n_words, length(indices))
    indices <- sample(indices, n_words)
  }

  all_words[indices]
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

  res <- purrr::map(words, syn, n_words)

  purrr::set_names(res, words)

}
