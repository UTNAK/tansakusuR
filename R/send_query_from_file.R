#' Read a query string from a file and send it to a SPARQL endpoint
#'
#' @param endpoint_url a string representing URL of SPARQL endpoint
#' @param file         a path to a file of SPARQL codes. i.e. ./example.sparql
#' @param format       a string that specify return format, default="df"
#'
#' @return A data frame or json data of a query result
#' @export
#'
#' @examples
#' sparqlfile <- "./examplequery.sparql"
#' endpoint_url <- "https://query.wikidata.org/sparql"
#' df <- send_query_from_file(endpoint_url, sparqlfile, format="df")
#' 
send_query_from_file <- function(endpoint_url, file, format="df"){
  query_string <- readr::read_file(file)
  result <- send_query(endpoint_url, query_string, format)
  return(result)
}