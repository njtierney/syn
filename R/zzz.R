#' Fetch the wrods list and create the R data if it doesn't exist on file
#'
#' @param words_filename location of Moby words.txt file
#' @param syn_filename location of processed syn.rds file
#'
fetch_and_create <- function(words_filename = "~/words.txt",
                             syn_filename = "~/syn.rds") {

  # If we don't have a words.txt file then download it
  if (!file.exists(words_filename)) {
    message("Downloading ", words_filename)
    get_thesaurus(words_filename)
  }
  message("Loading ", words_filename)

  # If the syn.rds file doesn't exist then create it
  if (!file.exists(syn_filename)) {
    parse_thesaurus(words_filename, syn_filename)
  }

}


.onLoad <- function(...) {

  words_filename <- "~/words.txt"
  syn_filename <- "~/syn.rds"

  # Only go through the pain of downloading if in interactive mode
  if (interactive()) {
    fetch_and_create()
  }

  # always try and load the data if the file exists. This is so
  # the data gets loaded even if we're not interactive e.g. knitting Rmd
  if (file.exists(syn_filename)) {
    packageStartupMessage("Loading ", syn_filename)

    # Read in our pre-parsed synonyms data structure
    words_syn <- readRDS(syn_filename)

    # Create a new environment in which to store our dynamic data
    # Add store it in "options" so that it's available to elsewhere
    syn_env <- new.env()
    options(syn_env = syn_env)

    # Store our words list in this environment.
    syn_env$words_syn <- words_syn
  }

}
