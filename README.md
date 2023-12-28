
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tansakusuR

A wrapper for SPARQL endpoints

## Installation

You can install the development version of “tansakusuR” from
[GitHub](https://github.com/UTNAK/tansakusuR) with:

``` r
# library(devtools)
#install_github("UTNAK/tansakusuR")
```

## Usage

``` r
library(tansakusuR)
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
```

You can visualize the queried result as follows;

``` r
library(DT)
datatable(df)
#> PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
```

<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-1a8e05f5c4f407ff7421" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-1a8e05f5c4f407ff7421">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7","8","9","10"],["1958-08-17T00:00:00Z","1958-10-11T00:00:00Z","1958-11-08T00:00:00Z","1958-12-06T00:00:00Z","1959-03-03T00:00:00Z","1959-11-26T00:00:00Z","1960-03-11T00:00:00Z","1960-09-25T00:00:00Z","1960-10-10T00:00:00Z","1960-12-15T00:00:00Z"],["http://commons.wikimedia.org/wiki/Special:FilePath/Pioneer%20able.png","http://commons.wikimedia.org/wiki/Special:FilePath/Pioneer%20able.png","http://commons.wikimedia.org/wiki/Special:FilePath/Pioneer%20able.png","http://commons.wikimedia.org/wiki/Special:FilePath/Pioneer%203.jpg","http://commons.wikimedia.org/wiki/Special:FilePath/Pioneer-3-4.gif","http://commons.wikimedia.org/wiki/Special:FilePath/Able%20IV%20World%27s%20First%20Space%20Engine.jpg","http://commons.wikimedia.org/wiki/Special:FilePath/Pioneer-5.jpg","http://commons.wikimedia.org/wiki/Special:FilePath/Pioneer%20P-1%20P-3%20P-30%20P-31.jpg","http://commons.wikimedia.org/wiki/Special:FilePath/Mars%201M.jpg","http://commons.wikimedia.org/wiki/Special:FilePath/Pioneer%20P-1%20P-3%20P-30%20P-31.jpg"],["Pioneer 0","Pioneer 1","Pioneer 2","Pioneer 3","Pioneer 4","Pioneer P-3","Pioneer 5","Pioneer P-30","Mars 1M No.1","Pioneer P-31"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>date<\/th>\n      <th>picture<\/th>\n      <th>spaceProbeLabel<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
