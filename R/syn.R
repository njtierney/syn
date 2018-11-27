#' Syn: Get synonyms for one word
#'
#' @param word character, one word you want to find synonyms for.
#' @param n_words integer, the number of words to look for. An integer Default is all words
#'
#' @return synonyms of the word you entered. Returns `character(0)` if word not found.
#'
#' @examples
#' # put some examples here
#' syn("good")
#' syn("evil", 25)
#' # No words for spelling mistakes
#' syn("spolling misteak")
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
#' @return named list of synonyms. Returns `character(0)` if word not found.
#' @examples
#' syns(c("good", "evil"), 10)
#' # No words for spelling mistakes
#' syns("spolling misteak")
#' @export
syns <- function(words, n_words = -1) {

  res <- lapply(X = words,
                FUN = syn,
                n_words)

  names(res) <- words

  res

}
