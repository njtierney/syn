thesaurus_exists <- function(){
  as.logical(fs::file_exists(here::here("data-raw/words.txt")))
}

stop_if_thesaurus_exists <- function(){
  if (thesaurus_exists()){
    stop("")
  }
}
