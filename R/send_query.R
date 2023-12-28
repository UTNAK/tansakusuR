#' Send a query string to a SPARQL endpoint
#'
#' @param endpoint_url a string representing URL of SPARQL endpoint
#' @param query_string a string of SPARQL codes
#' @param format a string that specify return format, default="df"
#'
#' @return A json data of a query result
#' @export
#'
#' @examples
#' endpoint_url <- "https://query.wikidata.org/sparql"
#' query_string <-'
#' SELECT ?spaceProbeLabel ?date ?picture
#' WHERE
#' {
#'   ?spaceProbe wdt:P31 wd:Q26529;
#'   wdt:P18 ?picture;
#'   wdt:P619 ?date . #mandatory
#'   SERVICE wikibase:label {
#'     bd:serviceParam wikibase:language "fr,en" .
#'   }
#' }
#' ORDER BY ?date
#' LIMIT 10
#' '
#' 
send_query <- function(endpoint_url, query_string, format="df"){
  # send a query string to a SPARQL endpoint
  httpResponse <- httr::POST(
    url = endpoint_url,
    query = list(query = query_string)
    )
  
  # extract results from http response
  content <- httr::content(httpResponse, as = "text", encoding = "UTF-8")

  # if the http response is ok, extract queried data from the response
  if(httpResponse$status_code == 200){
    # Convert to Json
    resultJson <- jsonlite::fromJSON(content, simplifyVector = FALSE)
    # return a result based on the format parameter
    if(format == "json"){
      result <- resultJson
    }else{
      # Convert to dataframe
      result <- purrr::map_dfr(resultJson$results$bindings, function(binding) {
        return(purrr::map_chr(binding, ~ .x$value))
      }) |> dplyr::select(c(unlist(resultJson$head$vars)))
    }
  }else{
    # return error strings
    result <- content
    # print error
    print("Error")
    cat(content)
  }
  
  
  return(result) 
}