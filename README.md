# tansakusuR

A wrapper for SPARQL endpoints

## Installation

```{r}
library(devtools)
install_github("UTNAK/tansakusuR")
```


## Usage

```{r}
library(tansakusuR)
```

You submit SPARQL queries using the `send_query()` function.

```{r}
endpoint_url <- "https://query.wikidata.org/sparql"


query_string <-'
SELECT ?spaceProbeLabel ?date ?picture
WHERE
{
  ?spaceProbe wdt:P31 wd:Q26529;
        wdt:P18 ?picture;
        wdt:P619 ?date . #mandatory
  SERVICE wikibase:label {
    bd:serviceParam wikibase:language "fr,en" .
  }
}
ORDER BY ?date
LIMIT 10
'

df <- send_query(endpoint_url, query_string)

library(DT)
datatable(df)

```