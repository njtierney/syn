

#' Parse the Moby words list
#'
#' @param words_filename the location of 'words.txt' from moby thesaurus
#' @param rds_filename the destiniation file
#'
#' @return
#'
#' @importFrom purrr map map_chr set_names
#' @export
#'
parse_thesaurus <- function(words_filename, rds_filename = "~/syn.rds") {

  # Read each line into a character vector
  words_raw <- readLines(words_filename)

  # split the words between commas
  words_split <- map(words_raw, ~strsplit(.x, split = ",")[[1]])

  # Name each list of words with the first word in the list
  words_syn <- set_names(words_split, map_chr(words_split, 1))

  message("Compressing...")
  saveRDS(words_syn, file = rds_filename, compress = 'xz')
}
