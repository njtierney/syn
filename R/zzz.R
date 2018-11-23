
.onLoad <- function(...) {
  if (!interactive()) { return() }

  packageStartupMessage("in onLoad()")

  words_filename <- "~/words.txt"
  syn_filename <- "~/syn.rds"

  if (!file.exists(words_filename)) {
    packageStartupMessage("Downloading ", words_filename)
    get_thesaurus(words_filename)
  }
  packageStartupMessage("Found ", words_filename)

  if (!file.exists(syn_filename)) {
    packageStartupMessage("Creating ", syn_filename)
    parse_thesaurus(words_filename, syn_filename)
  }
  packageStartupMessage("Found ", syn_filename)

  # Somehow read in our pre-parsed synonyms data structure
  words_syn <- readRDS(syn_filename)

  # Create a new environment in which to store our dynamic data
  # Add store it in "options" so that it's available to elsewhere
  syn_env <- new.env()
  options(syn_env = syn_env)

  # Store our words list in this environment.
  syn_env$words_syn <- words_syn
}
