#' Install the thesaurus from moby website
#'
#' Installs the thesaurus from the [moby website here](https://github.com/words/moby/blob/master/words.txt)
#'
#' @param words_filename the location of the moby words file list
#'
#' @return nothing - it installs the text file
#'
#' @export
#'
#' @examples
#' \dontrun{
#'  get_thesaurus()
#' }
get_thesaurus <- function(words_filename = "~/words.txt"){
  utils::download.file(
    url = "https://raw.githubusercontent.com/words/moby/master/words.txt",
    destfile = words_filename
  )
}
