
.onLoad <- function(...) {
  message("in onLoad()")

  # Somehow read in our pre-parsed synonyms data structure
  words_syn <- readRDS("~/syn.rds")

  # Create a new environment in which to store our dynamic data
  # Add store it in "options" so that it's available to elsewhere
  syn_env <- new.env()
  options(syn_env = syn_env)

  # Store our words list in this environment.
  syn_env$words_syn <- words_syn
}
