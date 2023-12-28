#' Read a query string from a file and show it
#'
#' @param file   a path to a file of SPARQL codes. i.e. ./example.sparql
#'
#' @export
#'
show_query <- function(file){
  query_string <- readr::read_file(file)
  cat(query_string)
}
  