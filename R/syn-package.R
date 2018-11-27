#' syn
#'
#' syn provides a dependency free way to get synonyms of words.
#'
#' @seealso
#'
#' It's main functions are:
#' \itemize{
#'   \item [syn()]
#'   \item [syns()]
#' }
#'
#' Learn more about visdat at \url{syn.njtierney.com}
#' @name syn
#' @docType package
#' @importFrom stats setNames
NULL

if(getRversion() >= "2.15.1")  utils::globalVariables(c("."))
globalVariables(c("setNames"))
