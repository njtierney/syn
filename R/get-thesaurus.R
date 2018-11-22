#' Install the thesaurus from moby website
#'
#' Installs the thesaurus from the [moby website here](https://github.com/words/moby/blob/master/words.txt)
#'
#' @return nothing - it installs the text file
#'
#' @export
#'
#' @examples
#' \dontrun{
#'  get_thesaurus()
#' }
get_thesaurus <- function(){

  if (fs::file_exists(here::here("data-raw/words.txt"))) {
    stop("File 'words.txt' already exists")
  }
  utils::download.file(
    url = "https://raw.githubusercontent.com/words/moby/master/words.txt",
    destfile = here::here("data-raw/words.txt")
  )
}
