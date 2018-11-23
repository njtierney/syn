

#' Parse the Moby words list
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

  message("Compressing...")
  saveRDS(words_syn, file = syn_filename, compress = TRUE)
}
