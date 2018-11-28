
suppressPackageStartupMessages({
  library(dplyr)
})


# Grab the moby words list if not already downloaded
moby_words_filename <- here::here("data-raw", "moby-words.txt")

if (!file.exists(moby_words_filename)) {
  utils::download.file(
    url = "https://raw.githubusercontent.com/words/moby/master/words.txt",
    destfile = moby_words_filename
  )
}


# Read each line into a character vector
words_raw <- readLines(moby_words_filename)

# split the words between commas
words_split <- purrr::map(words_raw, ~strsplit(.x, split = ",")[[1]])

# Get all the unique words
all_words <- sort(unique(purrr::flatten_chr(words_split)))

# Name each list of words with the first word in the list
words_syn <- purrr::set_names(words_split, purrr::map_chr(words_split, 1))


# Turn each word into an index into the 'all_words' data.
# this takes a few minutes. This halves the data size and means
# the package will be under 5MB
words_idx <- words_syn %>% purrr::map(~which(all_words %in% .x))


# Generate the antonyms
source('data-raw/create-r-antonyms-data.R')

# Create homophones
source(here::here("data-raw", 'create-homophones.R'))

# Save all
usethis::use_data(all_words, words_idx, words_ant, all_phons, compress = 'xz', internal = TRUE, overwrite = TRUE)
