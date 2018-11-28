

#' Hom: Get homophones for one word
#'
#' Homophones are determined by comparing the phonetic encoding of words.  If
#' they have the same phonetic encoding, then they are considered to sound
#' alike.
#'
#' The algorithms available for phonetic encoding are:
#' \itemize{
#' \item{\code{dbm} - double metaphone (matching primary encodings). \url{https://en.wikipedia.org/wiki/Metaphone#Double_Metaphone}}
#' \item{\code{dbmalt} - double metaphone (matching primary encodings with secondary encodings)}
#' \item{\code{soundex} - \url{https://en.wikipedia.org/wiki/Soundex}}
#' }
#'
#'
#' @param word character, one word you want to find homophones for.
#' @param n_words integer, the number of words to look for. An integer Default is all words
#' @param algos one or more of c('dbm', 'dbmalt', 'soundex').
#'
#' @return homophones of the word you entered. Returns `character(0)` if word not found.
#'
#' @examples
#' hom("good")
#' hom("evil", 25)
#' # No words for spelling mistakes
#' hom("spolling misteak")
#' @export
hom <- function(word, n_words = -1L, algos = 'dbm') {

  word_idx <- match(word, all_words)

  if (is.na(word_idx)) {
    return(character(0))
  }

  algos <- match.arg(algos, c('dbm', 'dbmalt', 'soundex'), several.ok = TRUE)

  # for the phon matches using the given algorithm
  find_matching_word_idxs <- function(this_algo, ref_algo = this_algo) {
    which(all_phons[[this_algo]] == all_phons[[ref_algo]][word_idx])
  }

  hom_idxs <- c()

  # Find all the words with the same phonetic encoding in Double Metaphone
  if ('dbm' %in% algos) {
    idxs <- find_matching_word_idxs('dbm_primary')
    hom_idxs <- c(hom_idxs, idxs)
  }

  # Double Metaphone has the concept of 'primary' and 'alternate'
  # encodings. Specifying 'dbmalt', matches the primary encoding of the word
  # against the secondary encoding of other words, and vice versa
  if ('dbmalt' %in% algos) {
    idxs <- find_matching_word_idxs('dbm_primary', 'dbm_alternate')
    hom_idxs <- c(hom_idxs, idxs)

    idxs <- find_matching_word_idxs('dbm_alternate', 'dbm_primary')
    hom_idxs <- c(hom_idxs, idxs)
  }

  # Find all the words with the same phonetic encoding in Soundex
  if ('soundex' %in% algos) {
    idxs <- find_matching_word_idxs('soundex')
    hom_idxs <- c(hom_idxs, idxs)
  }

  # simplify
  hom_idxs <- sort(unique(hom_idxs))

  # remove the word we started with
  hom_idxs <- setdiff(hom_idxs, word_idx)

  if (n_words > 0L && length(hom_idxs) > 0L) {
    # Avoid trying to sample more words than we have.
    n_words  <- min(n_words, length(hom_idxs))
    hom_idxs <- sample(hom_idxs, n_words)
  }

  # return a list of words
  all_words[hom_idxs]
}




#' homs: Get homophones for many words
#'
#' @param words word, character - many words you want to find homophones for
#' @param n_words integer, the number of words to look for. An integer Default is all words
#' @param algos one or more of c('dbm', 'dbmalt', 'soundex').
#'
#' @return named list of homophones. Returns `character(0)` if word not found.
#' @examples
#' homs(c("good", "evil"), 10)
#' # No words for spelling mistakes
#' homs("spolling misteak")
#' @export
homs <- function(words, n_words = -1, algos = 'dbm') {

  res <- lapply(X = words,
                FUN = hom,
                n_words,
                algos)

  names(res) <- words

  res

}
