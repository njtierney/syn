

#' Parse the Moby thesaurus word list into a R list and save to file
#'
#' The word list as downloaded is a raw text file with one index word per line.
#' Following each index word is a comma-separated list of synonyms.
#'
#' This code splits that original text file into lines, breaks up the words
#' from each line (by splitting on commas) and creates a named list of
#' character vectors.
#'
#' @param words_filename the location of 'words.txt' from moby thesaurus
#' @param syn_filename the destiniation file
#'
#' @export
#'
parse_thesaurus <- function(words_filename = "~/words.txt", syn_filename = "~/syn.rds") {

  # Read each line into a character vector
  words_raw <- readLines(words_filename)

  # split the words between commas
  words_split <- purrr::map(words_raw, ~strsplit(.x, split = ",")[[1]])

  # Name each list of words with the first word in the list
  words_syn <- purrr::set_names(words_split, purrr::map_chr(words_split, 1))

  message("Saving ", syn_filename)
  saveRDS(words_syn, file = syn_filename, compress = TRUE)
}
