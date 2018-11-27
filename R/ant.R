#' Ant: Get antonyms for one word
#'
#' @param word character, one word you want to find antonyms for.
#' @param n_words integer, the number of words to return.
#'
#' @return antonyms of the word you entered. Returns `character(0)` if word not found
#'
#' @examples
#' ant("good")
#' ant("evil", 25)
#' # No words for spelling mistakes
#' ant("spolling misteak")
#' @export
ant <- function(word, n_words = -1) {

  res <- words_ant[[word]]

  if (n_words > 0L && length(res) > 0L) {
    # Avoid trying to sample more words than we have.
    n_words <- min(n_words, length(res))
    res <- sample(res, n_words)
  }

  all_words[res]

}

#' Ants: Get antonyms for many words
#'
#' @param words word, character - many words you want to find antonyms.
#' @param n_words integer, the number of words to look for.
#'
#' @return named list of antonyms. Returns `character(0)` if word not found
#' @examples
#' ants(c("good", "evil"), 10)
#' @export
ants <- function(words, n_words = -1) {

  res <- lapply(X = words,
                FUN = ant,
                n_words)

  names(res) <- words

  res

}
