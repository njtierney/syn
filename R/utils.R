thesaurus_exists <- function(){
  as.logical(fs::file_exists(here::here("data-raw/words.txt")))
}

stop_if_thesaurus_exists <- function(){
  if (thesaurus_exists()){
    stop("stop if thesaurus exist")
  }
}

stop_if_no_thesaurus <- function(){
  if (!thesaurus_exists()){
    stop("'words.txt' file does not exist. ")
  }
}
