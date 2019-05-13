#' Return the number of words in a string
#'
#' @param x a string
#'
#' @return vector of numbers
#' @export
#'
#' @examples
#' syn_end <- syn("end")
#' syn_end_words <- n_words(syn_end)
#' syn_end[syn_end_words <= 1]
n_words <- function(x){
  lengths(strsplit(x, " "))
}
